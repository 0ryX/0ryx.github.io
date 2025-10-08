+++
title = "The Great Firewall Breach and Bypass"
date = 2025-10-08
+++

# The Great Firewall's Source Code Leaked and The Tools To Bypass It 

Last month [China's Great Firewall](https://gfw.report/blog/geedge_and_mesa_leak/en/) (GFW) had it's largest internal document leak ever. This was posted on September 11th with over 500GB of source code, work logs and internal communication showing details of research and development as well as operations.

### Download:

- **Bittorrent:** [](https://enlacehacktivista.org/geedge.torrent)

Due to the highly sensitive nature of these leaked materials, we strongly advise anyone who chooses to download and analyze them to take proper operational security precautions. It may be possible that these files may contain potentially risky content and accessing them in an insecure environment could expose you to surveillance or malware.

Please consider analyzing these files only in an isolated (virtual) machine without internet access.

## Modern Proxies & Firewall Bypasses for Internet Freedom

Independence and freedom as individual are core human needs. Without them our minds are restricted and our progress derailed not only of oneselves but as a collective. To defend those needs from being stripped away is to protect in a very real way our existence.

Many of us agree adults should have the right of their own body and mind, to be responsible for oneself. The aim of the guide is to give you exactly that insight on how to achieve it in times of need whom can come tomorrow. It isn't about technology but about freedom. Freedom countries around the world want to take away from you.

Nobody is insured and the best insurance is to take a bit of time and study the topic I'm putting infront of you. Same way you learned about Tor, same way you learned about safe purchasing, same way you learned about harm reduction, the material we're getting into won't go away any time soon. In fact things will only get worse and worse worldwide. Protect yourself, your loved ones and your fellow humans by taking some minutes to read it through, experiment with and catch up to the wave.

## Internet Freedom

One of the most effective tools for control over you as individual is the Internet. No amount of man power can stop if people would rise but a very small amount can sway the masses by altering public perception, squeezing information flows and misdirecting. Such is represented on national level by changing what websites are allowed or what protocols are available. China and Russia as example frequently work together in efforts to better control their Internet spaces.

Solutions like VPN (OpenVPN, IPSEC, Wireguard, Softether), SSH and traditional protocols all get blocked. In restrictive whitelist first environments accessing Tor or anything on the outside can be a complicated challenge even for advanced hackers. A system like the Great Firewall or GFW for short is a futuristic and dystopian example of what any country at any time can do. No country is immune as the political winds change and Internet freedom today doesn't guarantee it tomorrow.

Throughout the guide I'll be referring to the GFW as it's the most advanced and restrictive country-wide network of its kind. Deep Packet Inspect or short DPI are now almost standard in most networks even in corporate America. However GFW employs additional tricks such as Active and Passive Probing to enhance its capabilities among others.

Hackers can draw additional benefit from the guide too for say chaining connections through these regions to achieve higher connection anonymity, needing a bypass out. Whatever your reasoning I'll share details and knowledge based on my experience as I do believe it's of importance.

## Hello World

Since it's a complete guide I'll have to go over the basics. You can skip this chapter if you already know what proxies are and how they work.

### What is a Proxy?

Proxy is server in the middle whom processes your requests to website and other servers. Proxies can hide your IP from websites and they have a lot of legitimate uses too.

{% note(header="Note") %}
Your IP --- Proxy IP --- Website
{% end %}

If the proxy is configured well and your end too, the website will only see the proxy IP. Tor in simple terms is a giant proxy network carrying your requests through at least 3 nodes before it reaches the website you'd like to visit. It's a more complex and much more surveillance proof option than simple proxy.

### How proxies compare to VPNs

 Majority of VPNs would employ some sort of encryption to protect the network traffic. Proxies on the other hand in many instances don't use any encryption.

If we take the example

{% note(header="Note") %}
Your IP --- Proxy IP --- Website
{% end %}

on ISP level

{% note(header="Note") %}
Your IP --- Proxy IP --- Website
<----ISP---->
{% end %}

Your ISP can read your traffic direct without any problems and see what websites you're requesting to see.

VPN would have the same functionality to hide your IP.

{% note(header="Note") %}
Your IP --- VPN IP --- Website
////ISP////
{% end %}

Your ISP can't read your traffic because the VPN encrypts it.

Simple proxy or VPN regardless of encryption would be detected by your national firewall. While it might not be blocked it'll be classified as proxy, VPN or Tor. Hiding Tor or most protocols with bridges too isn't realistic.

### Active and Passive Probing

Another difference we should clear out to better understand the rest of the topic. Active and Passive probing are two ways firewalls would detect the protocol and connection type in order for classifiers to be applied.

Passive probing observes traffic without testing or injecting any packets. Conclusions are infered by the timing, protocol and other pre set characteristics of your connection. Passive probing is very widespread.

Active probing on the other hand interfers with network traffic and can inject packets into your connection stream or attempt to query the target destination such as website to generate response. The responses it receives can give key information whom can be used to infer the connection type and classifier applied. Active probing is less widespread because of technical capabilities and required resources to deploy and effectively manage it.

## Proxies and More Proxies

How it all started

**2012**
- Shadowsocks is light, similar to SOCKS5, encrypted tunnel mainly used in 2012 up until 2016. It's easy detectable for passive or active probes whom prompted a whole series of innovation.

**2016**
- Later v2ray became the successor to Shadowsocks eco system and VMESS came along from 2016. v2ray in contrast isn't a protocol but rather a framework that supports multiple transports TCP, WebSocket, gRPC, mKCP. It too made it relative easy to fingerprint because of metadata patterns such as the fixed length fields and markers and predictable structure.

**2019**
- In 2019 VLESS was born. It removed session layer encryption present in VMESS, dedicating that role to TLS.

   Around the same time TLS in TLS problems started being detected. Most notable example being Trojan tunnel which impersonates HTTPS with a TLS handshake crafted to look like HTTPS. Trojan was one of the first and most popular tools to circumvent blocking in China. Nested TLS unfortunately created fingerprints whom could be distinguished especially by active probing.

**2021**
- All of that gave birth to XTLS and Vision in 2021. XTLS is modified layer similar to TLS as it doesn't need to do TLS nesting, instead its integrating the framing and authentication into the TLS handshake behavior itself. Vision on the other hand is evolution of XTLS focused rather on controling the flow and more practical mitigation.

**2022**
- XRAY CORE was forked from v2ray core and integrated Vision, XTLS and other fallbacks. Until today it's the main driver for rapid innovation and solid base for quickly rolling out practical anti censorship solutions.

Around the same time REALITY and uTLS were created. uTLS is a TLS client whom can reproduce diverse ClientHello fingerprints from major browsers making connections appear as browsers for avoiding passive fingerprinting firewall rules. On the other side (pun intended) REALITY is a server side mechanism whom steals ServerHello bytes from sites and layers authentication token in the post handshake (or embedded structures). REALITY main goal is to help defeat very strict networks like GFW whom have SNI whitelist censoring and very active probing. It was created after it was observed SNI whitelist being deployed in some ISPs in China and Iran. The result makes the handshake it initiates indistinguishable from whitelisted domains.

We'll talk at length at the end of the article but for now know recent VLESS over XTLS uTLS fingerprinting or VLESS over REALITY for SNI whitelist regions are fairly used. HTTP3, gRPC transports and other fallback methods are baked in as standard practice.

Honorable mentions of protocols, tunnels and solutions I won't get into are mKCP, Cloak, Hysteria, NaiveProxy, Sing box. If you'd like a more complete historic background with the drama and the whys I suggest to visit

[](https://vk.com/@s0r0kan-tehnologii-obhoda-blokirovok-v2ray-xray-xtls-hysteria-cloak)

## VLESS+TLS vs VLESS+XTLS

Quick note on the difference since the practical bypasses section and other next mentions it.

**How it connects**

One combination can be VMESS over TLS. Client has TLS handshake followed by VMESS handshake and framing producing two handshakes one after the other.

Another combination is VLESS over XTLS. XTLS embed the authentication within the TLS handshake itself reducing TLS in TLS nesting problems and making the initiation more stealthy.

VLESS+TLS uses the normal TLS of the browser or OS for the connection (OpenSSL, BoringSSL and others). Passive fingerprinting looking at ClientHello and ServerHello fields. Active fingerprinting can attempt to send VLESS inside TLS and figure out responses.

VLESS+XTLS replaces the normal layering with XTLS handshake whom integrates authentication into the TLS mimicked handshake avoiding layering TLS over TLS (XTLS core and library). Passive fingerprinting harder because no inner TLS ClientHello/ServerHello. Active fingerprinting much harder too because configuration can be to silent drop making it near impossible to tell if it's initiating unauthenticated connection on random host (auth expected early but probes with no proof are dropped).

**In plain English**, VLESS+TLS is like ordinary TLS connections but in situations where TLS in TLS nesting is suspicious or perceived to attempt to fool the firewall, VLESS+XTLS would be better because traffic looks like single layer TLS.

## Proxy Tunnels vs VPN

We now know a bit more about proxy authentication and encryption. Lets now compare it to say OpenVPN on tunnel integrity & use of cryptographic primitives.

### Authenticated Encryption with Associated Data AEAD

Important concept to understand is AEAD. AEAD is a cryptographic primitive whom does data integrity and confidentiality in one go. Plaintext is encrypted and ciphertext is produced with additional authentication tag.

When a proxy uses encrypted tunnel like HTTPS, TLS or others, AEAD makes sure the proxy can't be tampered with payloads to be decrypted. With our scenarios if GFW terminates the TLS, AEAD protects the proxy to client segment. It helps GFW or any network not figuring out what the purpose of the proxy connection is or see details inside it. AEAD ciphers further add tamper detection and privacy to VPNs or any TLS protocol. AEAD ciphers of AES-GCM or Chacha20-Poly1305 is recommended on proxy tunnels however this on its own won't protect from detection or give ability to bypass network filters.

### Perfect Forward Secrecy PFS

PFS makes sure if your long term keys are compromised attacker can't decrypt past recorded sessions or conversations. PFS is achieved with ephemeral key exchange like ECDHE where session keys wouldn't be derived from long term keys. PGP as good as it is doesn't offer PFS means if you're chatting away on XMPP with PGP plugin you don't have PFS protection on your data in case either party gets compromised.

When proxy forwarded E2E encrypted PFS tunnel (without termination) traffic is ever intercepted it won't be possible to later decrypt it regardless if the keys had been leaked.

Both AEAD and PFS are cornerstones in modern proxy solutions we're about to explore.

### Comparisons

If we assume the OpenVPN TLS tunnel is setup correctly on every part including authentication via certificate, HMAC integrity and others the comparison table would look

![Comparison Table](/img/table-01.png)

### Server Name Indication SNI

In simple terms SNI relays to the server what hostname it wants to reach during the TLS handshake. The SNI is TLS extension but sent in plaintext in the ClientHello part. SNI is useful in corporate networks as example to tell inner company firewall where to route a packet without need to decrypt the entire TLS payload.

### Encrypted Client Hello ECH

In simple terms ECH encrypts most of the ClientHello including the SNI bit making the hostname and other fields hidden from passive observers whom are trying to learn information from TLS handshake.

What it means in proxy relations is ECH helps defend against firewalls whom filter based on the hostname. Some firewalls might drop the connection if they can't read the SNI or in the case of GFW, it uses a whitelist SNI approach allowing only specific hostnames to be connected to.

![Resistance Table](/img/table-02.png)

If the implementation is correct the confidentiality of some of the mentioned stacks can be easily compared to OpenVPN or TLS wrapped VPNs. The main difference being how well audited and how mature those custom stacks are.

You can clearly see from the table traffic analysis is significantly improved with certain combinations because they minimize unique artifacts while blending with whitelisted TLS handshakes.

## Good Luck I'm Behind 7 Proxies

GFW is taken as example because it's at moment the most aggressive national firewall.

Some of it's more known capabilities are

- **Passive Fingerprinting**. Packet size, timing, ClientHello and ServerHello TLS fingerprints, TLS extension ordering, traffic entropy, ALPN, directions per packet as well looking at series of packets for any tell features.
- **Active Fingerprinting/Probing**. Connects to suspected proxies and does series of handshake specific to protocol it suspects to try and get identifiable response back.
- **Deep Packet Inspection (DPI)**. Examines packet paloads and others to identify and classify network connections. It can inspect traffic via aggressive MITM or TLS termination or in cases where metadata isn't protected and leaks like SNI or DNS.
- **Machine Learning**. Uses trained model and classifiers (AI) to spot any anomalies.
- **TLS Tampering**. Sometimes referred as Flow Injection, this intercepts and attempts to modify handshake messages or inject silent RSTs.
- **SNI Whitelisting**. Allow TLS handshakes only with the SNI matching from pre approved list while completely blocking others before any application data is sent.

Let's now measure up those to what we have learned and see the results

![Detection Table](/img/table-03.png)

Each feature represent a potential attack vector (detection) by the firewall. I'll make a simple illustration in the next table

Lets pick out the top winners

![Proxy Table](/img/table-04.png)

In comparison we can take a look how the GFW sees some of protocols how some of its known capabilities match up.

![Final Table](/img/final-table.png)

From the table comparisons you can easily see how modern and aggressive firewalls match up against current cutting edge solutions like XTLS-REALITY and other custom stacks. It's arms race in censorship and tools like XTLS give a platform to build on and innovate in easier way than building up everything from the ground up. At any point XTLS can be distinguished from standard TLS by sophisticated adversary keep it in mind.

### Worried about Quantum Computers?

Whether they come soon or at all, Project X already has post quantum ideas and running deployment and audit of proposed PQ algorithms. Check their github.

## How XTLS Helps

We've covered a lot of theory, established primitive differentiations and gave a small taste of what the GFW can do. Next 2 chapters can be skipped if you don't want to get into more technical explanations.

XTLS initiation would look like
- **Step 1)** Initiate TLS ClientHello.
- **Step 2)** Exchange keys as in ECDHE.
- **Step 3)** Carry client authentication as in UUID/PSK immediate after handshake. At this point the server can drop your request or accept it. 
- **Step 4)** Application framing consisting of application payloads sent in AEAD protected XTLS records.

Compared to standard TLS differences may exist depending on the implementation and server/client configurations of XTLS such as custom extension bytes in ClientHello, packet sizes or timing revealing a nested packet structure and others. As we talked about it earlier don't rely entirely on XTLS to be indistinguishable to standard TLS.

## XTLS Combined

XTLS as we know can be combined in a custom stack. Let's examine how it'd look to GFW.

XTLS contains the VLESS authentication without needing to nest the TLS ClientHello or ServerHellos. REALITY mimicks ServerHello returns as high volume site or content delivery network (CDN). uTLS appends ClientHello to match Chrome fingerprint of same ALPN, extension order, key_share and others.

In this example GFW on its end fingerprints the ClientHello (JA3), checks the SNI whitelist, does aggressive active probing, deploys DPI and almost real time machine learning on the timing and packet sizes. We'll exclude anything else for simplicity sake.

### uTLS ClientHello Chrome

I won't get into TLS fingerprinting as it probably deserves a topic on its own (used in antidetect browsers) but you can visit

[](https://tls.peet.ws)

for a large TLS fingerprint database run by volunteers. Another one is

[](https://ja3.zone)

It helps us get insight into most common fingerprints and ability to append our own to these in order to bypass firewalls whom use wide spread collection of such on their own as the GFW. I'll use example real fingerprint from there to illustrate about our topic. TLS fingerprinting can be useful in corporate networks too where you'd want to get outside connection or silently extract data without triggering red flags (bonus not all protocols are watched).

It'd be easier to show it on a picture but I've noted down the most important bits. Lets say we have something like

```
16 03 01 00 7a
01 00 00 76
03 03
d4 3a 9f
00
00 20
13 01 13 02 13 03 c0 2b c0 2f
01 00
00 4e
00 0d 00 1a 00 17
00 2b 00 03 02 03 04
00 0a 00 0a 00 08 00 1d 00 17 00 18
00 33 00 26 00 24 00 1d
00 23 00 00 00 05 68 32
```

Let's focus on the bits important to us for the Chrome fingerprint. We first have the TLS handshake beginning

```
(16) (03 01) (00 7a)
(TLS record type handshake) (record version) (length of record)
```

 and the ClientHello

```
(01) (00 00 76)
(ClientHello handshake type) (length of handshake)
```

The next interesting part is the 2 byte cipher suite ID whom achieves the fingerprint to blend in like Chrome is right after the bytes indicating the length of the cipher suites 0x0020. The ordering itself matters because Chromes ordering used in JA3 fingerprints is specific.

```
(13 01) (13 02) (13 03) (c0 2b) (c0 2f)
(TLS_AES_128_GCM_SHA256) (TLS_CHACHA20_POLY1305_SHA256) (TLS_AES_256_GCM_SHA384) (TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256) (TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256)
```

Following the extension ID sequence is important

```
00 0d 00 1a 00 17
```

and what supported versions as TLS 1.3 0x002b, supported_groups with 2 bytes referencing their IANA named groups,

```
(00 0a) (00 0a) (00 08) (00 1d) (00 17) (00 18)
(length of extension) (length of list) (x25519) (secp256r1) (secp384r1)
```

 key share 0x0033 and finally the ALPN bytes 0x68 and 0x32 corresponding to h and 2 respectively as in h2 http/1.1 encoded.

```
00 23 00 00 00 05 (68 32)
(ASCII h2)
```

Matching the order and contents and sequence as well the supported_groups and key_share allow us to match JA3 fingerprint like Chromes defeating passive fingerprinting.

### REALITY ServerHello

You can apply the same byte examination of ServerHello mimicked by REALITY but it can vary depending on how its setup no need for representation.

Since they are mimicked and manipulated, the ServerHello fields would match whitelisted site or CDN, bypassing the SNI checks as well passive fingerprinting would validate it as legitimate TLS handshake.

### XTLS+VLESS

First we have the application record protected by XTLS with the payload encrypted but the outer part itself looks like TLS. The decrypted payload can only be seen by the server and client. After AEAD the very first bytes would usually showcase the VLESS authentication frame.

Since the outer record looks like normal TLS data no nested TLS in TLS ClientHello or ServerHello are present. To prevent active probing it can be setup to drop silently without response as to only client with the secret UUID can access it or unlock any protocol behaviors.

### GFW Scanning

Taking our example and deploying GFW passive checking.

- **Step 1)** Checks ClientHello and it sees it matches a common browser thanks to uTLS. Check normal TLS traffic.
- **Step 2)** Checks Serverhello response to match a whitelisted hostname as CDN or a site thanks to REALITY. Check SNI whitelist pass.
- **Step 3)** Check application records sizes and timing packets with single layer TLS thanks to XTLS. Check no nested TLS fingerprints.
- **Step 4)** Checks REALITY blob or XTLS ciphertext being indistinguishable from normal post handshake data or HTTP/2 frames to passive DPI systems. Check.

We turn our attention to active probes.

- **Step 1)** GFW connects to the IP and sends a probe trying to negotiate TLS. It can mean sending a VLESS or VMESS probe or crafted XTLS probe. If correct configuration of REALITY dropping silently with no protocol specific response, the probe fails.
- **Step 2)** GFW issues REALITY probe but without the current REALITY public key and creating a valid encrypted proof token the probe fails.
- **Step 3)** GFW issues active probe specific to XTLS but without exact XTLS framing and keys the probe will fail due to any response.


We have now bypassed both active probes and passive fingerprinting.

I'd caution against making mistakes like repeating the same IP or domain leading to getting flagged, making sure REALITY or XTLS doesn't leave same extension bytes (use real ServerHello bytes from major CDNs) or the most common one being having crafted not perfect uTLS fingerprint resulting in mismatch.

## Knowledge and Tools in Practice

### Practical Tools

XTLS - contains libraries and specifications

[](https://github.com/xtls)

XRAY CORE - VLESS, VMESS, XTLS, REALITY, VISION.

[](https://github.com/xtls/xray-core)
[](https://github.com/xtls)

V2RAY CORE - VLESS+TLS, VMESS, multiple transports like WebSockets gRPC.

[](https://github.com/v2ray/v2ray-core)

uTLS - client TLS fingerprint cloning

[](https://github.com/refraction-networking/utls)

REALITY - option inside XRAY CORE. Refer XRAY Core.

### Practical Bypasses

China, Iran, Turkmenistan, Russia - examples with varying difficulty. Other countries around the world might not deploy active blocking but is assumed to have similar capabilities on the passive spying side.

In the country order listed you can try the bypasses from China/GFW to other countries and from next country to the next on the list, no reason exists to repeat the obvious in text.

## Working bypasses in China (2025)

GFW has high capability, lots of real time bandwidth capture capacity, active probing and employs machine learning DPI. Forget about simple configured pluggable transports or public bridges to Tor. Those don't work as everyone knows.

Before I list what actually works remember random blocking can happen at any time. No guarantee the IP or IP range you chose would stay healthy and clean, you wouldn't get into rule specific GFW quotas (other users) or don't conform to region specific GFW rules. Specifically if you're user out of China, try to pick a hosting with connection to mainland Chinese Internet.

*If you ever get blocked with the listed methods don't panic*. Choose other VPS, other IP, other provider, other port and try again. If it doesn't work, do the same but with another method (enable fallback if proxies).

- **VLESS-XTLS-uTLS-REALITY**. VLESS over XTLS with client side uTLS (ClientHello mimicry) and Reality obfuscation. Must be deployed on your own VPS. Frequent key rotation and firewall rules to drop active probes. Don't rely on single transport and have several fallbacks XTLS, WebSocket+TLS or Reality - [](https://github.com/XTLS/Xray-core)
- Your own private OBFS4 Bridge with IAT Mode 2

How *VLESS-XTLS-uTLS-REALITY* combination with fallbacks works against GFW?


- *VLESS* helps avoid any additional fingerprints on the app layer whom GFW actively seeks.
- *XTLS* ommits what is seen as fingerprint when connections happens.
- *uTLS* helps ClientHello in TLS be close to Firefox or Chrome whom lowers simple fingerprinting detection built into the GFW.
- *Reality* helps avoid visible differences at handshake level by mimicking real ServerHello bytes and hiding proof tokens.
- *Fallbacks* like WebSocket or QUIC help with active probes or passive analysis from the GFW whom target non HTTP patterns.

More complete byte level explanation available in previous chapters.

### Tips in practice for better success


- Use real stable domains with real cert chains. Poorly configured ones can result in issues if you aren't tunneling forward (you probably should).
- ClientHello TLS fingerprints should be tested and leverage uTLS templates to be precise.
- Always allow multiple inbound fallbacks. Targetted blocks are real thing.
- Keep at least one extra backup server if you can afford it.

### Other alternatives


- Install VPN that works in China (don't connect it to your personal information like bank card), then tunnel the hotspot connection to Tails. Common, inexpensive solution with unlimited data. - **Try VPN providers your peers say works**. - [AirVPN](https://airvpn.org/)
- Roaming sim cards which will direct tunnel your IP to another country complete bypassing GFW. Uncommon, expensive solution with sometimes these connections are severely restricted, limited data. - *Any provider whom works in these regions*.

## Working bypasses in Iran (2025)

Turkmenistan on other hand has smaller infrastructure but entire state owned with raw blocking of a lot of options albeit lesser sophistication of the DPI.

- **VLESS-TLS.** TLS with common SNI and CDN endpoints. Domain fronting. - Examples inside follow it https://github.com/XTLS/Xray-core

## Working bypasses in Russia (2025)

Russia has mixed capability depending on ISP because it isn't as centralized as in state owned Turkmenistan telco.

The situation is much more relaxed than in China and you can get away with VPN like Outline or lesser but well configured VPN connections in stunnel or specific port or forks of Shadowsocks to some extend.

Tor works selectively but not for prolonged periods without transport protocols.

Russia and China actively share information on national firewalls keep it in mind.

## Working bypasses rest of the world


You might not need to bypass any harsh network filtering in other countries only working with simple VPN port change. However. Many Western countries employ a great deal of passive surveillance on connections whom would trigger investigations or would be marked as suspicious.

To counter the deceitful tactics you can use latest bypasses from places like China, allowing you to slip past network detectors and stop your connection getting flagged. I'd like to point out it's near impossible to hide most protocol usage.

## What We Learned

Based on everything we have established the following about the current state of modern national firewalls and bypassing them

- **VLESS-XTLS-uTLS-REALITY** can be excellent combination but not a sure proof way for every firewall, many combinations exist give them a try now you know you have basic understanding.
- When passive fingerprinting is issue, uTLS can help with that by mimicking clients in combination with VLESS-XTLS or VLESS-REALITY.
- To counter active probing you can configure fail safes for the server to silently drop unauthenticatd probes and not leak anything on it.
- Correct management of certificates and sites/CDN is key as any mismatches can trigger rules.
- If the firewall is aggressive with TLS in TLS nesting, reduce the layer by using XTLS
- Where SNI whitelistings is in play, REALITY is one of the best most effective solutions to counter that.

I'd like to once again point out although XTLS-REALITY bypasses a lot of filters, it uses custom state machines and that increases the risk of implementation errors compared to OpenVPN. Where you can and if the situation calls for one in the first place, use obfuscated or TLS wrapped OpenVPN solution as these are more mature.

## Closing Words

If the internet becomes like in China in most countries the knowledge you've acquired today by reading everything and experimenting on your own wasn't a waste. You've instead made the first steps to learning a valued skill in acquiring Internet freedom and giving yourself piece of sovereignty by refusing to be a victim of external policies.
