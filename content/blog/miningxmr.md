+++
title = "Securing Digital Privacy With Mining XMR"
date = "2026-01-23"
+++

# The Broadcast ...

Hello again, 

   This is a broadcast from the resistance, it's now 2026 and this signal is coming to you from inside the walls of a fallen nation. The political climate is.... Messy to say the least. From behind enemy lines we can see that fascism in America is on the rise and the future of this nation is uncertain. 

   Political assassinations are common now days and within the last 6 months we've seen Minnesota House of Representatives Speaker Emerita Melissa Hortman and her husband Mark fatally shot in their homes, June 14th 2025. Also Minnesota State Senator John Hoffman and his wife, Yvette, were shot in their home in a related attack and attempted assassination on the same night, both survived. 
   
   Nuno Loureiro, a MIT professor was fatally shot in his home on December 15th 2025 and on December 13th there was a mass shooting at Brown University by the same alleged assassin. Nuno Loureiro was Professor of Nuclear Science and Engineering and Professor of Physics at MIT, and Director of the Plasma Science and Fusion Center. 

   The United States has kidnapped the President of Venezuela, Nicolas Muduro and his wife on January 3rd 2026 in what is being said to be a move to eliminate Narco cartels from supplying the underground market of fentanyl. As the US bombs fishing boats in international waters outside Venezuela and many more innocent lives are lost at the hands of this Imperialist country, we know from past wars with Iraq that this is nothing more then us invading a sovereign nation to steal it's resources and oil. 

   ICE raids and anti-ICE protests are common, mixing themselves within the Free Palestine movement. Recently an ICE agent shot and killed Renee Good in Minneapolis on January 7, 2026. On January 8th Federal agents shot 2 more people in Portland, On January 14th another man was shot by an ICE agent in Minneapolis. January 21st agents shot a man in Willowbrook California and today January 24th Federal agents shot Alex Pretti 9-10 times after wrestling him to the ground in Minneapolis Minnesota. He was surrounded and being attacked by several agents. Minnesota seems to be a hotspot for these incidents and the front line of the resistance.

## The Eye Of The Storm

   In JRR Tolkien's *The Lord Of the Rings*, a *"Palantir"* is a powerful seeing stone allowing the user to see something taking place far away. But if it falls into the wrong hands - like it did when it came under the control of Sauron - it can be used to distort reality, and deceive and manipulate its viewer. 

   Palantir Technologies is a data analytics company used by governments, militaries, and intelligence/defense agencies to combine and analyze data from multiple sources. Their founder and CEO Peter Thiel was the co-founder of PayPal with Elon Musk and is part of the "Tech Bro" elite funding the Trump regime's campaign and in turn is getting lucrative government contracts. Thiel is also part of the right-wing Christian Nationalist think tank Project 2025.

   Palantir started its AI training model in Israel and was used on Palestinians by the IDF. Now the US government is reportedly using a tool called ELITE by Palantir to aid ICE in identifying neighborhoods with high concentrations of potential deportation targets. 

   Surveillance Technologies like ELITE are being weaponized against US citizens more and more and the need for technologies like Monero are crucial now more then ever. Online privacy is a must; censorship and the collection of user data has created it's own economy making your online activity a commodity. 

## Fighting Back Will Take All of Us

   **What is the difference between digital rights and human rights?**

  * When was the last time you learned about a police or military force harming a community?
  * Where did you learn that information?
  * When was the last time you saw hundreds of thousands of people on the street, calling for legislative change?
  * Where did you see those pictures? 
  * How did those people learn about that protest and decide to join it?
   {% end %}

   We use the internet to spread information and anybody fighting for human rights today is using some sort of technology: to share flyers or photos on social media, to communicate with a group on a messaging app, or to send messages to their representatives via email. Technology makes the fight for human rights possible on a global scale. The threat is that most tech we use today is controlled by Big Tech. While they may be conducting surveillance and controlling the flow of information. What you see is shown to you through straight up censorship, algorithm manipulation, and shadow banning. Governments are doing the same to repress and censor us. Because we are a direct threat to their power. 

   {% quote(header="Peter Thiel's most famous quote:") %}
   “I no longer believe in the compatibility of freedom and democracy.”
   {% end %}

### There Is No Democracy Without Digital Rights

   This is the connection between digital rights and human rights: they are both intertwined and you cannot have one without the other. Mass surveillance is expanding, laws that widen intrusive powers are multiplying, and wars redraw the boundaries of what can be said, often making room for censorship. 

## Mining Monero 

   Late last year, Monero faced a notable attack when Qubic — a rival cryptocurrency project — temporarily gained control over a majority of the network's hashrate. In August 2025, Qubic miners took 51% dominance (with peaks reportedly as high as 65% - though not proven). But this was an expensive attack and Qubic couldn't hold control very long. This shows the need for individuals to run their own node and by doing so, helping secure the network to make it stronger. Decentralization is what make's Monero so strong and the number one cryptocurrency in privacy and this attack highlights why decentralization remains a crucial part of Monero's philosophy and long-term security and resilience. By running your own node using the official Monero software, [monero-wallet-cli](https://www.getmonero.org/downloads/#cli), is the single best way a user can contribute to the privacy and security of the Monero blockchain,

         
   * *Enhanced personal privacy:* connecting your wallet to a local node instead of a remote node, you avoid leaking transaction data or IP addresses to third parties. Your own node ensures you're the only one with that visibility, maximizing Monero's ring signatures, stealth addresses, and overall privacy guarantees.

   * *Strengthening the blockchain:* you increases the network's decentralization by distributing the load of syncing, validating, and relaying blocks/transactions. This makes the entire ecosystem harder to censor, attack, or manipulate.

   * *Helping prevent or mitigate attacks:* A more decentralized network with thousands of independent nodes reduces the impact of any single entity (or coordinated group) controlling hashrate. While nodes don't directly mine or add hashrate, they enforce consensus rules, reject invalid blocks/chains, and help the honest chain prevail faster during reorg attempts. In a 51% scenario, widespread node participation ensures quicker detection and recovery, limiting what an attacker can achieve.

## Getting Started

   Today we will be going over a very basic setup to get you started, but since I am on Arch Linux and you are likely on another system like Windows or Debian, your commands will be different. You can start by heading over to the official Monero website, [get monero](https:..getmonero.org) there is tons of good information here but you'll want to start by either choosing the official Monero GUI wallet or the CLI version which is what I am using. Head on over to the githubreleases for x64 shasum to check the download is the correct one and you are actually getting the official CLI. Once the bz2 file is installed, run the following command:

   ```bash
      # At the time of writting this post this was the official hash, replace that hash with your current one to tesk
      echo "423b49f3658e29f70a1d971667dec924c7ee7a107cfc93440456e28500b471a6  monero-linux-x64-v0.18.4.5.tar.bz2" | shasum -a 256 --check
   ```
   Output:
   ```bash
      monero-linux-x64-v0.18.4.5.tar.bz2: OK
   ```

   Run the following to unzip and install:
   ```bash
      # Create a clean install directory (use sudo since /usr/local is system-wide)
      sudo mkdir -p /usr/local/monero

      # Extract the tarball into it (adjust filename/version if different)
      sudo tar -xjf monero-linux-x64-v0.18.4.5.tar.bz2 -C /usr/local/monero --strip-components=1
      # --strip-components=1 skips the top folder (monero-linux-x64-v0.18.4.5/) so binaries are directly in /usr/local/monero/

      # (Alternative if you don't want --strip: extract normally then mv)
      # sudo tar -xjf monero-linux-x64-v0.18.4.5.tar.bz2 -C /usr/local/monero
      # sudo mv /usr/local/monero/monero-linux-x64-v0.18.4.5/* /usr/local/monero/
      # sudo rmdir /usr/local/monero/monero-linux-x64-v0.18.4.5

      # Make symlinks in /usr/local/bin (this is in $PATH by default on Arch)
      sudo ln -sf /usr/local/monero/monerod         /usr/local/bin/monerod
      sudo ln -sf /usr/local/monero/monero-wallet-cli /usr/local/bin/monero-wallet-cli
      sudo ln -sf /usr/local/monero/monero-wallet-rpc /usr/local/bin/monero-wallet-rpc
      # Add more if you use other binaries like monero-gen-ssl-cert, etc.

      # Verify
      monerod --version
      monero-wallet-cli --version
   ```
   
### Create User Account   

   Now, I'm not a fan of running software as myself or root unless I absolutely have to. If possible, I like to "jail" my apps and programs in their own user account and give them permission to access anything else. Let's create a user account specifically for Monero.

   Let's start with the group, then create the user so it can default to that group:

   ```bash
   # Create a system group named 'crypto' with a specific GID (200)
   # (GID 200 is fine if it's free and you want it fixed; otherwise omit -g to auto-assign)
         sudo groupadd --gid 200 crypto

   # Create a system user named 'xmr'
   # --system: marks it as a system account (low UID range, no aging, etc.)
   # -g crypto: sets primary group to 'crypto' (GID 200)
   # --home-dir /home/crypto/xmr: sets home (even for system users, useful for data/config storage)
   # -s /usr/bin/nologin: prevents login (best practice for daemon/service users)
   # No -m needed unless you want to auto-create the home dir skeleton (optional)
      sudo useradd --system \
                   --gid crypto \
                   --home-dir /home/crypto/xmr \
                   --shell /usr/bin/nologin \
                   xmr

   # Optional but recommended: Create the home directory with proper ownership
   # (useradd doesn't create it automatically without -m)
      sudo mkdir -p /home/crypto/xmr
      sudo chown -R xmr:crypto /home/crypto/xmr
      sudo chmod 700 /home/crypto/xmr   # Restrict to owner only
   ```

### Configure

   We need to create a configuration file for our daemon that it can use so it knows what it needs to do. I'm going to be using ~/.monerod.conf as my configuration file in this example. You can use whatever you like, just translate accordingly:

   ```config
   p2p-bind-ip=0.0.0.0
   p2p-bind-port=18080
   rpc-bind-ip=127.0.0.1
   rpc-bind-port=18081
   no-igd=1
   hide-my-port=1
   disable-dns-checkpoints=1
   enable-dns-blocklist=1
   zmq-rpc-bind-ip=127.0.0.1
   zmq-rpc-bind-port=18082
   zmq-pub=tcp://127.0.0.1:18083
   ```

   #### A quick Breakdown of the Options
         
   * p2p-bind-(ip|port): These are the bind IP and Port options for the p2p network. Monero uses a peer-to-peer network connection in order to facilitate the state of the network. This program is critical to Monero operations and this Port is public to enable all the nodes to talk and find each other.

   * rpc-bind-(ip|port): These are the RPC Client IP and Port options for commanding the daemon. RPC is Remote Procedure Call or a standard for how commands are sent across HTTP connections. What's important to note is that this port is available to send commands and instruct the Monero daemon to do things like submit transactions, validate blocks that have been submitted to the network, track transaction history and obfuscate, encrypt and secure the Monero network in general. If you are not careful, you can lose your crypto with this port open, so please be careful not to just leave it exposed to the Internet on a public port. If you do, secure it with SSL and ensure it requires authentication, and set it to view-only with --restricted-rpc.

   * no-igd: Don't do u-plug-n-play stuff with the router to open a port.

   * hide-my-port: Don't announce yourself on the network as a receiving peer. Read "unlisted" rather rather than "hide", IMHO.
    disable-dns-checkpoints/enable-dns-blocklist: These were options recommended as per p2pool instruction guides.

   * zmq-rpc-bind-(ip|port): ZMQ stands for Zero-Message-Queue. These are the 0-MQ bind IP and Port options that control where Monero(d) will listen for RPC-based ZMQ connections.

   * zmq-pub: This is the address of the publisher will be setup to broadcast information p2pool will be using. I suspect it might be for block announcements, transfer of transaction data within blocks and other options from within the daemon itself. I haven't read all the source to Monero yet, so I can't say for certain, just speculating there. This is what p2pool will want for it's ZMQ endpoint when you run this program later in this tutorial.

### Running our Daemon 

   The first time we run our daemon (monerod) we'll be installing the blockchain. Either a full node or to save space a pruned node, the following is downloading the pruned version of the node to save space.

   ```bash
      sudo -u xmr /usr/local/monero/monerod --data-dir /home/crypto/xmr/.bitmonero --prune-blockchain --detach
   ```

### XMRig

   This is the best part, we're going to set everything up to run automatically on startup with systemd. But first we need to install XMRig which luckily for us the AUR has a donateless version of XMRig.

   ```bash
      yay xmrig
   12 aur/gupaxx-git 1.7.1-1 (+0 0.00)
       GUI Uniting P2Pool And XMRig
   11 aur/gupax 1.3.10-2 (+1 0.00) (Out-of-date: 2025-08-15)
       GUI Uniting P2Pool And XMRig
   10 aur/xmrig-mo-cuda 6.22.1mo1-1 (+0 0.00)
       NVIDIA CUDA plugin for XMRig miner, MoneroOcean fork.
   9 aur/xmrig-mo-beta 6.2.0mo2-1 (+0 0.00)
       Beta Version - High performance RandomX and CryptoNight CPU miner, with MoneroOcean auto alg switching
   8 aur/xmrig-proxy 6.24.0-1 (+0 0.00)
       Stratum protocol proxy for Monero; HTTP API disabled, donation percentage is 0.
   7 aur/xmrig-mo-bin 6.25.0mo1-1 (+0 0.00)
       High performance RandomX, KawPow, CryptoNight, and AstroBWT CPU/GPU miner, with MoneroOcean auto alg switching. Pre-compiled.
   6 aur/xmrig-donateless 6.25.0-1 (+23 0.49) (Installed)
       RandomX, KawPow, CryptoNight, AstroBWT and GhostRider unified CPU/GPU miner and RandomX benchmark - No Donate Version
   5 aur/xmrig-cuda 6.22.1-3 (+6 0.00)
       NVIDIA CUDA plugin for XMRig miner.
   4 aur/xmrig-mo 6.25.0mo1-1 (+6 0.00)
       High performance RandomX, KawPow, CryptoNight, and AstroBWT CPU/GPU miner, with MoneroOcean auto alg switching
   3 aur/xmrig-donateless-git 3.2.0.r1380.919a6c0c-1 (+1 0.00)
       High Perf CryptoNote CPU Miner-No Donate Version
   2 aur/xmrig-c3-bin 6.12.0-1 (+1 0.00) (Orphaned) (Out-of-date: 2021-09-19)
       Monero cryptocurrency CPU miner, with C3Pool auto alg switching
   1 extra/xmrig 6.25.0-1 (1.4 MiB 4.3 MiB)
       RandomX, KawPow, CryptoNight, AstroBWT and GhostRider unified CPU/GPU miner and RandomX benchmark
   ==> Packages to install (eg: 1 2 3, 1-3 or ^4)
   ```

   We're choosing 6 aur/xmrig-donateless. I'm not sure why but you must run xmrig as root for things to run properly. 

### P2Pool

   p2pool is a decentralized mining pool software that is designed to be the bridge between your Monero(d) daemon running and your xmrig or other mining software. p2pool works by having a side-chain validate transactions and sometimes those shares end up being validated as blocks on the Monero chain. When you mine for a while, you will see a share has been accepted by you to the Network. When a block is found and you have accepted shares, then you get a payout directly from that block as rewards are paid immediately as part of the block transaction. A pretty nifty way to decentralize the network even further if mining itself is properly decentralized!

   #### Download and Install

   You can navigate to p2pool.io and click on the link that will take you to Github to download the software. Select the platform that suits you and download the compressed archive. Once downloaded, I unzipped it like so:

   ```bash
   # Create a clean install directory (sudo since /usr/local is system-owned)
   sudo mkdir -p /usr/local/p2pool

   # Extract the tarball (adjust filename/version to match your download, e.g., p2pool-v4.13-linux-x64.tar.gz)
   # -C specifies destination, --strip-components=1 removes the top versioned folder so binary is directly in /usr/local/p2pool/
   sudo tar -C /usr/local/p2pool -xzf p2pool-v4.13-linux-x64.tar.gz --strip-components=1

   # Alternative if you don't use --strip-components (extracts to versioned subfolder):
   # sudo tar -C /usr/local/p2pool -xzf p2pool-v4.13-linux-x64.tar.gz
   # Then optionally: sudo mv /usr/local/p2pool/p2pool-v4.13-linux-x64/p2pool /usr/local/p2pool/
   # (and remove the versioned dir if desired)

   # Create symlink in /usr/local/bin (this makes 'p2pool' callable from anywhere)
   sudo ln -sf /usr/local/p2pool/p2pool /usr/local/bin/p2pool

   # Verify
   p2pool --version
  ``` 
   
   Alternatively you can use the AUR
   ```bash
   # Install P2Pool system-wide via pacman (includes the p2pool binary)
   sudo pacman -Syu p2pool

   # Verify installation
   p2pool --version
   # or
   /usr/bin/p2pool --version   # pacman places it here
   ```

### Setup Systemd for Autostart

   Navigate over to /etc/systemd/system/ to create the following service files:

   monerod.service
   ```bash
   [Unit]
   Description=Monero Daemon (Full Node)
   After=network.target

   [Service]
   Type=simple
   User=monero
   Group=monero
   ExecStart=/usr/bin/monerod --non-interactive \
     --zmq-pub tcp://127.0.0.1:18083 \
     --enable-dns-blocklist \
     --prune-blockchain \                  # Optional: Saves ~2/3 disk space
     --data-dir /var/lib/monero \
     --config-file /var/lib/monero/monerod.conf
   Restart=on-failure
   RestartSec=10s
   TimeoutStopSec=60s
   KillMode=mixed

   [Install]
   WantedBy=multi-user.target   ```

   monero-wallet-rpc.service
   ```bash
   [Unit]
   Description=Monero Wallet RPC
   After=network.target monerod.service
   Before=p2pool.service

   [Service]
   User=monero
   Group=monero
   ExecStart=/usr/bin/monero-wallet-rpc \
     --wallet-file /var/lib/monero/mining-wallet \
     --daemon-address 127.0.0.1:18081 \
     --rpc-bind-port 18082 \
     --disable-rpc-login \                 # Use only if no external access!
     --confirm-external-bind=0
   Restart=always
   RestartSec=10s

   [Install]
   WantedBy=multi-user.target 
   ```

   p2pool.service
   ```bash
   [Unit]
   Description=P2Pool (Monero Mini Sidechain)
   After=network-online.target monerod.service
   Wants=network-online.target monerod.service

   [Service]
   User=monero
   Group=monero
   WorkingDirectory=/var/lib/monero
   ExecStart=/usr/bin/p2pool --mini \
     --host 127.0.0.1 \
     --wallet YOUR_MINING_WALLET_ADDRESS_HERE \
     --data-dir /var/lib/monero/p2pool \
     --stratum 0.0.0.0:3333 \              # Local only; bind to 127.0.0.1 if paranoid
     --p2p 0.0.0.0:37888 \                 # Open for better connectivity
     --outpeers 32 \
     --loglevel 2
   Restart=on-failure
   RestartSec=30s
   ReadWritePaths=/var/lib/monero/p2pool
   Nice=10
   CPUSchedulingPolicy=idle

   [Install]
   WantedBy=multi-user.target
   ```

   xmrig.service
   ```bash
   [Unit]
   Description=XMRig Miner (Local P2Pool)
   After=network-online.target p2pool.service
   Wants=network-online.target p2pool.service

   [Service]
   User=monero
   Group=monero
   ExecStart=/usr/bin/xmrig --config=/var/lib/monero/xmrig-config.json -o 127.0.0.1:3333
   Restart=on-failure
   RestartSec=30s
   Nice=19
   CPUSchedulingPolicy=idle
   # For huge pages (performance boost): enable via sysctl or script, not root
   # Avoid CAP_SYS_ADMIN unless absolutely necessary

   [Install]
   WantedBy=multi-user.target
   ```
      
   After creating the files, run:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl enable --now monerod.service
   sudo systemctl enable --now monero-wallet-rpc.service
   sudo systemctl enable --now p2pool.service
   sudo systemctl enable --now xmrig.service
   ```

## In Closing 

In our data driven and AI economy online surveillance has become the norm, but it doesn't have to be and we cannot trade comfort for human rights. Tools like Monero are one of the last true standing bastions for privacy and data ownership, and even that is being questioned right now with the new coming hard fork. If you're on r/Monero at all in the last week you'll have seen these topics being [discussed](https://www.reddit.com/r/Monero/comments/1qjsizi/this_controversy_is_really_good/). But again we have to think that there are forces at play a lot larger then what were used to seeing and I really like what is stated [here](https://www.reddit.com/r/Monero/comments/1qnwhru/relevant_reminder_monero_is_constantly_under/), Monero by design is a threat and I know for a fact governments are using a data analytics tool called Chainanalysis that tracks every single block transaction and wallet in seconds. Reading these reports, I'd rather not cite those sources here but if you know how to get in touch with me, which I've found that some of you do (I may have had a stalker or two) then reach out and I shall share them with you. Fact of the matter is Monero, even with the power of AI and all their tools and tricks and money they can throw at it, still cannot be beat. Through ring signatures, stealth addresses, and confidential transactions - make it exceptionally resistant to "chain analysis" or Chainanalysis if you will.... government tracking, and automated surveillance systems. 

Monero embodies at its core, privacy is and as a basic human right. And Monero's solution towards mining is directed directly at everyday users, keeping those with the potential to spend more money on larger GPU's out of the equation and allowing only daily driver CPU to mine it's blocks means this crypto currency has had you in mind all along. So why not participate in securing its blockchain and use decentralized pools like p2pool and get rewarded for it in the process? Whether you're mining to support the network, donating privately, or safeguarding your own savings, you're contributing to a broader fight against centralized control.Stay vigilant, keep learning, update often and above all = protect your data and privacy. Stay sovereign... and never stop questioning surveillance.


- 🏴‍☠️ 0ryX Signing off

........................................................... 
This has been a broadcast from your local resistance network
...........................................................
