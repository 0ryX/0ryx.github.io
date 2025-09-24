+++
title = "Hardening Tor Browser"
date = "2025-09-24"
+++

# Hardened Tor Browser, Advanced OPSEC for Maximum Anonymity

If you’re reading this, you probably already know that real privacy online takes more than just using Tor Browser or following a checklist. Over the last few years, tracking techniques have advanced, and the loss of true OS spoofing in Tor Browser has made small differences in your configuration or hardware even more important. While hardening your browser and adjusting settings can close real security holes and reduce your exposure to tracking, it can also make your setup more unique compared to the default Tor Browser, which could actually hurt your anonymity by making you stand out.

The default Tor Browser is designed to make all users blend together, maximizing anonymity even if that means leaving some fingerprinting vectors open for the sake of uniformity. If you change too many settings, you may reduce the chance of being tracked by scripts or targeted exploits, but at the same time, you risk creating a fingerprint that is different from the majority of Tor users. Because of this, there is always a tradeoff between security and anonymity. This guide is here to give you information about what each advanced setting does, how it can help or hurt, and to help you decide what works best for your own threat model.

Before making changes, understand that for some people, blending in by sticking to the Tor defaults may be the best choice. For others, closing every possible security hole may be worth a little extra uniqueness. There is no one-size-fits-all answer, so use these settings thoughtfully and always test your setup to see how it performs both for privacy and anonymity. At the end of the guide, I’ll share the actual anonymity test results I got after applying these settings, so you can see the impact for yourself.

![ninja shit](/img/giphy.webp)

you probably already know the biggest OPSEC fails don’t happen because you “slip up” with PGP or forget to double-encrypt files. The real leaks happen in your browser, metadata, unique fingerprints, storage, and side-channels all get weaponized by LE and deanonymization researchers. Tor Browser is good out of the box, but if you really want to keep your activity, identity, and even hardware off the record, you need to harden it yourself.

Before you start, you’ll need to access Tor Browser’s advanced settings. Open Tor Browser, type about:config in the address bar, and press Enter. You’ll see a warning, click “Accept the Risk and Continue.” Now you can use the search bar to find any setting in this guide. If a setting already exists, double-click to toggle true/false values, or click the pencil icon to enter numbers or text. If a feature doesn’t exist (mostly all these already exist), you can always create it: click the plus (+) button, then pick “Boolean” for true/false, “Number” for numbers, or “String” for words (rare). Every change takes effect immediately, and you don’t need to restart the browser unless otherwise noted. this will also work to harden Firefox, and Mullvad Browser. Also, remember to save these settings to a config file so you don’t have to repeat everything if you are using a disposable system.


## MOST IMPORTANT!!!

● Javascript.enabled = False
   - Disables all JavaScript, blocking most modern browser exploits and fingerprinting scripts. This stops many attacks and tracking methods

● privacy.sanitize.sanitizeOnShutdown = true
   - Ensures all cookies, cache, and storage are deleted every time you close Tor. Critical for avoiding forensic recovery and tracking across sessions. Basically as it says, wipes all data on shutdown.

## Advanced Privacy Settings

● dom.storage_access.enabled = false
   - Disables third-party sites from accessing local storage. Blocks sneaky cross-site tracking via DOM storage.

● dom.event.clipboardevents.enabled = false
   - Prevents sites from knowing when you copy/paste, which can be used for tracking and potential info leakage.

● geo.enabled = false
Disables geolocation APIs. Stops any accidental leaks of your real location.

● privacy.firstparty.isolate.block_post_message = true
   - Blocks postMessage cross-site communication, another cross-origin tracking method.

## Fingerprinting Protection

● privacy.resistFingerprinting.letterboxing = true
   - Enforces screen “letterboxing” to make your browser size non-unique, prevents tracking by window size.

● webgl.disabled = true
   - Disables WebGL, which leaks GPU details and enables unique fingerprinting.

● webgl.enable-webgl2 = false
   - Disables WebGL 2.0 (WebGL 1.0 is already disabled, this closes more fingerprinting vectors).

● media.peerconnection.enabled = false
   - Disables WebRTC, which can leak your real IP (even behind Tor/VPN).

● dom.enable_performance = false
   - Prevents websites from measuring performance/timing attacks on your system.

● dom.enable_performance_navigation_timing = false
   - Disables this detailed timing info. This makes it even harder for sites to fingerprint you based on your device or network performance.

● dom.enable_performance_observer = false
   - Stops sites from getting these real-time updates, further reducing fingerprinting and tracking options

● gfx.webrender.all = false
   - Turns off GPU-based rendering. GPU details can be fingerprinted, CPU-only rendering is less unique.

● privacy.resistFingerprinting.block_mozAddonManager = true
   - Hides info about whether you can install extensions, reducing browser uniqueness.

## Strict Cookie & Storage Controls

● network.cookie.lifetimePolicy = 2
   - Forces cookies to expire at the end of the session.

● network.cookie.thirdparty.sessionOnly = true
   - Makes third-party cookies session-only.

● browser.sessionstore.privacy_level = 2
   - Prevents saving sensitive data, such as POST form data, in session restore.

## Stricter Network & Referrer Control

● network.http.referer.spoofSource = true
   - Sends a fake referrer (for example, the same domain) instead of the real one, further protecting source site info.

● network.http.sendSecureXSiteReferrer = false
   - Prevents sending referrers when navigating between HTTPS sites, stops leaking origin data between secure sites.

● network.dns.disablePrefetch = true
   - Stops Firefox/Tor from pre-resolving DNS, which prevents leaking visited domains.

● network.predictor.enabled = false
   - Disables prefetching of pages, which reduces unnecessary network activity and minimizes leak potential.

● network.http.referer.hideOnionSource = true
   - Prevents sending .onion addresses as the referrer to clearnet sites, which protects your hidden service usage from leaking.

## Font Masking

● gfx.font_rendering.graphite.enabled = false
   - Disables Graphite font rendering, reducing fingerprint surface.

● layout.css.font-visibility.level = 3
   - Limits which fonts are revealed to sites: “3” = only standard system fonts (lowers fingerprinting risk).


## Network Isolation & Referrer Hardening

● network.http.referer.trimmingPolicy = 2
   - Only send the “origin” in the referrer header, strips out full paths (protects privacy across clicks).

● network.http.referer.XOriginPolicy = 2
   - Never send referrers to third-party sites, prevents cross-site tracking via referrer headers.

● network.http.referer.XOriginTrimmingPolicy = 2
   - Strips path and query when sending cross-origin requests.

## Time/Clock Protection

● privacy.resistFingerprinting.reduceTimerPrecision = true
   - Reduces JS timer resolution, which prevents high-res timing attacks (used for hardware/OS fingerprinting).

● privacy.resistFingerprinting.reduceTimerPrecision.microseconds = 10000
   - Sets how coarse the JS timers are. The higher, the safer, prevents micro-timing leaks.

## Strict Isolation

● fission.autostart = true
   - Site isolation, each site runs in a separate process, so leaks and cross-site exploits are harder.

● privacy.firstparty.isolate = true
   - Each domain gets its own storage/cookies, blocking cross-site tracking.

## Noise Reduction (Anti-Tracking/Mining)

● privacy.trackingprotection.fingerprinting.enabled = true
   - Activates anti-fingerprinting filter lists. Blocks sites known to fingerprint users.

● privacy.trackingprotection.cryptomining.enabled = true
   - Blocks cryptomining scripts. Prevents background resource abuse.

## Disabling APIs That Leak Data

● dom.webaudio.enabled = false
   - Disables web audio API, which can be used for fingerprinting (audio context leaks).

● media.eme.enabled = false
   - Disables Encrypted Media Extensions, reduces attack/fingerprint surface.

● media.video_stats.enabled = false
   - Prevents leaking video hardware decoding stats.

## Reducing Metadata Leaks

● browser.startup.blankWindow = true
   - Opens a blank page on startup. Prevents leaks from pinned tabs or previously opened sites.

● browser.download.start_downloads_in_tmp_dir = true
   - Downloads files to a temporary folder. Avoids leaving persistent traces on the filesystem.

● browser.helperApps.deleteTempFileOnExit = true
   - Deletes temporary downloaded files on exit. Further reduces leftover metadata and disk traces.

## Network & Connection Hardening

● network.dns.blockDotOnion = false
   - Allows .onion resolution through Tor DNS, needed for hidden services.

● network.proxy.socks_remote_dns = true
   - DNS queries go through Tor, not your local resolver, essential for anonymity.

● network.http.http3.enabled = false
   - Disables HTTP/3 (QUIC), a newer protocol with less mature privacy protections, stick to HTTP/2 for now.

● dom.push.enabled = false
   - Disables push notifications. Blocks background connections that can be used for tracking or triggering remote browser events.

## Enhanced Tracking & Fingerprinting Protection

● privacy.trackingprotection.enabled = true False
   - Blocks known trackers using Mozilla’s lists. See comments for detailed pros and cons of setting this to true or false. Setting it to false will help you blend in better (more anonymous), while true provides stronger protection against trackers and real-world security risks.

● privacy.trackingprotection.socialtracking.enabled = true
   - Extra blocks for social media trackers (like Facebook/Meta).

● privacy.annotate_channels.strict_list.enabled = true
   - Marks connections to trackers for stricter privacy.

● browser.send_pings = false
   - Disables ping requests when clicking links (used for click-tracking).

## Disabling Unnecessary Features

● browser.display.use_document_fonts = 0
   - Prevents sites from using their own fonts, reduces fingerprinting.

● pdfjs.enabled = true
   - Enables internal PDF viewer, so files aren’t handed off to external apps (safer).

● extensions.pocket.enabled = false
   - Disables Pocket, a Mozilla cloud feature, removes unnecessary network requests.

● browser.safebrowsing.malware.enabled = false
   - Disables Google SafeBrowsing checks (which ping Google). Trust yourself to avoid phishing/malware.

● browser.safebrowsing.phishing.enabled = false
   - As above, but for phishing detection. (Safer to rely on your own OPSEC, not Google.)

## Reducing Browser Identifiability

● webgl.enable-debug-renderer-info = false
   - Prevents sites from querying WebGL hardware details.

● media.navigator.enabled = false
   - Blocks access to webcam/mic info (WebRTC, media devices).

● dom.battery.enabled = false
   - Prevents battery status API (which leaks unique device info).

● device.sensors.enabled = false
   - Disables device sensor APIs, removes more mobile fingerprinting vectors.

## Miscellaneous Hardening

● accessibility.force_disabled = 1
   - Disables accessibility services, which can be used for fingerprinting.

● browser.cache.offline.enable = false
   - Disables offline cache, reducing disk traces.

● beacon.enabled = false
   - Disables the Beacon API, which lets sites send analytics data right as you leave a page (often used for tracking)

● clipboard.plainTextOnly = true
   - Forces pasted text to be plaintext. Prevents formatting and style info from leaking through the clipboard.

● extensions.torbutton.use_nontor_proxy = false
   - Disables using non-Tor proxies in Tor Browser. Makes sure all traffic goes through Tor, with no accidental clearnet leaks.

● extensions.torbutton.block_disk = true
   - Blocks Tor Browser from writing sensitive info to disk. Extra safeguard against disk leaks (forensics).

## Enforce HTTPS Everywhere (No Exceptions)

● dom.security.https_only_mode = true
   - Forces all connections to upgrade to HTTPS (encrypted), blocking all plain HTTP traffic by default (unless you manually allow).

● dom.security.https_only_mode.upgrade_local = true
   - Also forces HTTPS on localhost/127.0.0.1 connections. Maximum paranoia, rarely breaks anything for typical Tor use.

● security.mixed_content.block_active_content = true
   - Blocks scripts and iframes loaded over HTTP on HTTPS pages (prevents downgrade attacks and data leaks).

## Extreme Hardening (Optional/Advanced)


These settings are designed to close additional security vulnerabilities and block even more obscure fingerprinting and tracking methods. They are mainly for users with high security needs and are not necessary for typical Tor, Dread, or market use. Applying them can improve your security, but may make your browser more unique and reduce your overall anonymity

● webspeech.recognition.enable = false
   - Disables the speech recognition API (voice input), which could be used for voice fingerprinting or microphone-based exploits.

● webspeech.synth.enabled = false
   - Disables the speech synthesis API (text-to-speech). Closes a small, rarely used fingerprinting surface.

● media.hardwaremediakeys.enabled = false
   - Prevents websites from interacting with your media keys (like play/pause on your keyboard), which could reveal hardware or OS details.

● device.sensors.motion.enabled = false
   - Disables motion sensors (accelerometer/gyroscope). Prevents leaking device movement data, especially relevant on mobile.

● device.sensors.orientation.enabled = false
   - Disables orientation sensors (compass/rotation). Stops another way for websites to fingerprint or profile mobile devices.

● dom.gamepad.enabled = false
   - Disables the Gamepad API (game controller support). Rarely used, but closes a unique fingerprinting vector.

● browser.urlbar.suggest.searches = false
   - Disables live search suggestions in the address bar. Prevents data leakage to search engines as you type.

● media.gmp-gmpopenh264.enabled = false
   - Disables the OpenH264 plugin. This closes off a plugin/telemetry vector and removes another bit of plugin fingerprinting.

● media.gmp-widevinecdm.enabled = false
   - Disables Widevine DRM support (used for Netflix/streaming DRM). Shrinks fingerprint surface and eliminates remote DRM code execution.

● browser.helperApps.neverAsk.saveToDisk = application/pdf,application/octet-stream,application/zip
   - Presets the download handler for common filetypes. Prevents fingerprinting based on how your browser prompts for downloads and reduces accidental opening of risky files.

After changing all the settings in this guide, I got a uniqueness score of 1 out of 7,000. By simply changing privacy.trackingprotection.enabled to false, that improved to 1 out of 800.

In my opinion, a uniqueness of around 1 out of 800 is a great balance, it lets you blend in much better with other Tor users then if set to true, while still giving you the security and hardening benefits from all the other settings.

On Tails, before making any changes and with the security level set to Safest, I got a uniqueness score of 1 out of 144.46. After making all the changes from this guide except for the extreme hardening options and setting privacy.trackingprotection.enabled to false, my score was 1 out of 143.1. This shows that all these settings, except the extreme hardening ones, and privacy.trackingprotection.enabled set to false, actually increase anonymity while still closing important security flaws. I left out the extreme hardening options because those are specifically for closing extra security vulnerabilities, even if it means sacrificing some anonymity.

## How to Instantly Apply and Save All Tor Browser About:Config Settings on Tails

If you use Tails, Whonix, or any disposable Linux and want to apply your custom Tor Browser or Firefox settings in seconds (instead of clicking through about:config every time), do this:

**1. Make Your user.js File**

Open a plain text editor, and paste all your settings in this format (one per line):
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("javascript.enabled", false);
user_pref("network.cookie.lifetimePolicy", 2);

For every setting you want, follow this structure:
For true/false: user_pref("setting.name", true);
For numbers: user_pref("setting.name", 2);
For words: user_pref("setting.name", "string");

Then Save the file as user.js (not .txt)

**2. Save user.js in Persistent Storage**

Start Tor Browser at least once so it makes its profile folder, and make sure to set to safest. Open your home folder, go to:
/home/amnesia/.tor-browser/profile.default/ (On some systems it’s /home/amnesia/tor-browser/Browser/TorBrowser/Data/Browser/profile.default/)

If you don’t see the folder, click the three lines at the top of the file manager and enable “Show Hidden Files.”

Copy your user.js file from Persistent into this folder. Overwrite if it already exists.

**4. Restart Tor Browser**
Restart Tor Browser, all your settings from user.js will be loaded automatically. You do not need to use about:config. If you forgot to put it on Safest then you will see “custom security”, if you see that then change it to safest. All the configs will still be saved.

**5. Any Time You Update Your Setting**s
Just edit your user.js in Persistent, save it, and copy it again after you reboot.

Before you add the user.js file to the folder, make sure you Open Tor once, and set security to safest. then exit, and move the user.js file to the tor profile folder.


These settings are not just for show, every single one closes a fingerprinting, tracking, or deanonymization hole that’s been exploited before. Yes, Tor Browser is “paranoid” out of the box, but you have to assume the worst. This config kept me safe as a major market buyer/reseller for years.

Test your config: Use Cover Your Tracks, browserleaks.com, and ipleak.net after setting all this up. No OPSEC is perfect, but ideally you want to appear as close as possible to the default Tor user, while still closing real security issues and avoiding unique leaks.

If you’re serious about anonymity on Dread, markets, or anywhere Tor is your lifeline, lock your browser down. Don’t rely on defaults. Don’t assume you’re invisible because you’re behind Tor.
