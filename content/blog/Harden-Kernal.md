+++
title = "Hardening The Linux Kernel"
date = "2025-08-18"
+++

# Hardening The Linux Kernel

## Linux Hardening For a Better Tomorrow

In our blog post from last year we discussed how the internet is in the age of corporate surveillance. With data being one of the biggest commodities today, people of the internet are fighting back with blogs like the indieweb, fediverse, lemme, and believe it or not, areas of the darkweb. Though our threat landscape is diverse and expansive, especially if you’re using the darkweb, on Linux systems there are different measures we can take to lock-down and harden our systems.

Today’s focus will be on the Arch ecosystem. When your installing Arch, you’ll be given the option to choose which kernel you’d like. For those in the security sector, you’d choose the harden-kernel. But there are other options like Zen for performance and LTS for stability. Choosing the harden-kernel though gives a false sense of security due to a lot of points being left open to general users allow them to easily get a root shell and exposing important information on your system.

## Kernel Exploitation

[ROP](https://en.wikipedia.org/wiki/Return-oriented%60_%60programming)(Return-Oriented Programming) is a exploit technique that allows you to execute code in the presence of security defense. But since our attack surface is a lot bigger then that in userland you would probably want to use a script like [ROPGadget](https://github.com/JonathanSalwan/ROPgadget) to automate scanning our attack surface. We’ll go into kernel exploitation in another post though, for now we’re locking down our system for a more hardened setup. Bit as we talk about the different settings you’ll get a good understanding of what all we could look for and use in a Red Team application.

## Kernel Self-Protection

- In the following, we'll be using the *sysctl* to change our kernel settings.

Kernel pointers point to a specific location in kernel memory and are not hidden by default. You can find them located in */proc/kallsysms* The following settings aim to mitigate kernel pointer leaks.

1) kernel.kptr_restrict=2

Alternatively, you can set kernel.ktpr_restict=1 to only hide kernel pointers from processes without "CAP_SYSLOG" capability.

2) kernel.dmesg_restrict=1

*dmesg* is the kernel log. It exposes a large amount of useful kernel debugging information, which can often leak sensitive data, such as kernel pointers. Above restricts the kernel log to "CAP_SYSLOG"

3) kernel.printk=3 3 3 3

Despite the value of dmesg_restrict, the kernel log will still be displayed in the console during boot. Malware that is able to record the screen during boot may be able to abuse this to gain higher privileges. This must be used in combination with certain boot parameters.

4) kernel.unprivileged_bpf_disable=1
5) net.core.bpf_jit_harden=2

**eBPF** exposes quite large attack surface. As such, it must be restricted. these sysctls restrict eBPF to the "CAP_BPF" capability (CAP_SYS_ADMIN on kernel versions prior to 5.8) and enable JIT hardening techniques, such as constant blinding.

6) dev.tty.ldisc_autoload=0

This restricts loading TTY line disciplines to the "CAP_SYS_MODULE" capability to prevent unprivileged attackers from loading vulnerable line disciplines with the "TIOCSETD ioctl" which has been abused in a number of exploits before.

7) vm.unprivileged_userfaultfd=0

The "userfaultfd()" syscall is often abused to exploit use-after-free flaws. Due to this, this sysctl is used to restrict this syscall to the *CAP_SYS_PTRACE* capability.

8) kernel.kexec_load_disable=1

Kexec is a system call this is used to boot another kernel during runtime. This functionality can be abused to load malicious kernel and gain arbitrary code execution in kernel mode, so the sysctl disables it.

9) kernel.sysrq=4

The *SysRq* key exposes a lot of potentially dangerous debugging functionality to unprivileged users. Contrary to common assumptions, SysRq is not only an issue for physical attacks, as it can also be triggered remotely.The value of this sysctl makes it so that a user can only use the secure attention key, which will be necaessary for accessing root securely. Alternatively, you can simply set the value to 0 to disable SysRq completely.

10) kernel.unprivileged_userns_clone=0

User namespaces are a feature in the kernel which aim to improve sandboxing and make it easily accessible for unprivileged users. However, this feature exposes signigicant kernel attack surface for privileged escalation, so this sysctl restricts the usage of user namespaces to the "CAP_SYS_ADMIN" capability. For unprivileged sandboxing, it is instead recommended to use a setuid binary with little attack surface to minimise the potential for privilege escalation.

**Be aware though that this sysctl only exists on certain Linux Distros, as it requires a kernel patch. Alternatively you can disable user namespaces completely ( including for root ) by setting** *user.max_user_namespaces=0*

11) kernel.perf_event_paranoid=3

Preformance events add considerable kernel attack surface and have caused abundant vulnerabilities. This sysctl restricts all usage of performance events to the **CAP_PERFORM** capability. ( **CAP_SYS_ADMIN** on kernel versions prior to 5.8 )

 Be aware that this sysctl also requires a kernel patch, otherwise *kernel.perf_event_paranoid=2* only restricts a subset of this functionality.

## Network Self-Protection

1) net.ipv4.tcp_syncookies=1

This helps protect against SYN flood attacks, which are a form of denial-of-service attack, in which an attacker sends a large amount of bogus SYN requests in an attempt to consume enough resources to make the system unresponsive to legitimate traffic.

2) net.ipv4.tcp_rfc1337=1

This protects against time-wait assassination by dropping RST packets for sockets in the time-wait state.

3) net.ipv4.conf.all.rp_filter=1
   net.ipv4.conf.default.rp_filter=1
   
These enable source validation of packets received from all interfaces of the machine. This protects against IP spoofing, in which a attacker sends a packet with a fraudulant IP address.

4) net.ipv4.conf.all.accept_redirects=0
   net.ipv4.conf.default.accept_redirects=0
   net.ipv4.conf.all.secure_redirects=0
   net.ipv4.conf.default.sercure+redirects=0
   net.ipv6.conf.all.accept+redirects=0
   net.ipv6.conf.default.accept_redirects=0
   net.ipv4.conf.all.send+redirects=0
   net.ipv4.conf.default.send_redirects=0
   
These disable ICMP redircet acceptance and sending to prevent man-in-the-middle attacks and minimise information disclosure.

5) net.ipv4.icmp_echo_ignore_all=1

this setting makes your system ignore all ICMP requests to avoid Smurf attacks, makes the device more difficult to enumerate onthe network and prevent clock fingerprinting through ICMP timestamps.

6) net.ipv4.conf.all.accept_source_route=0
   net.ipv4.conf.default.accept_source_route=0
   net.ipv4.conf.all.accept_source_route=0
   net.ipv4.conf.default.accept_source_route=0
   
Source routing is a mechanism tha allows users to redirect network traffic. As this can be used to preform man-in-the-middle attacks in which the traffic is redirceted for nefarious purposes.

7) net.ipv6.conf.all.accept_ra=0
   net.ipv6.conf.default.accept_ra=0
   
Malicious IPv6 router advertisements can result in a man-in-the-middle attack.

8) net.ipv4.tcp_sack=0
   net.ipv4.tcp_dsack=0
   net.ipv4.tcp_fake=0
   
This disables TCP SACK. SACK is commonly exploited and unnecessary in many circumstances. so it should be disabled if it is not required/

## User-Space Self-Protection

1) kernel.yama.ptrace_scope=2

ptrace is a system call that allows a program to alter and inspect another running process, which allows attackers to trivially modify the memory of other running programs. This restricts usage of ptrace to only processes with the CAP_SYS_PTRACE capability. Alternatively, set the sysctl to 3 to disable ptrace entirely.

2) vm.mmap_rnd_bits=32
   vm.mmap_rnd_compat_bits=16
   
ASLR is a common exploit mitigation which randomises the position of critcal parts of a process in memory/ This can make a wide variety of exploits harder to pull off, as they first require an information leak. The above settings increase the bits of entropy used for mmap ASLR, improving its effectiveness.

The values of these sysctls must be set in relation to the CPU architecture. The above values are compatible with x86, but other architectures may differ.

3) fs.protected_syslinkms=1
   fs.protected_hardlinks=1
   
This only permits symlinks to be followed when outside of a world-writable sticky directory, when the owner of the symlink and follower match or when the firectory owner matches the symlink's owner. This also prevents hardlinks from being created by users that do not have read/write asscess to the source file. Both of these prevent many common TOCTOU races.

4) fs.protected_fifos=2
   fs.protected_regular=2
   
These prevent creating files in potentially attacker-controlled environments, such as world-writable directories, to make data spoofing attacks more difficult.

## Boot parameters

Boot parameters pass settings to the kernel at boot using your bootloeader. Some settings can be used to increase security, similar to sysctl. Bootloaders often differ in how boot parameters are set. A few examples are listed below, but you should research the required steps for your specific bootloader.

- If using Grub as your bootloader, edit */etc/default/grub*, and add your parameters to the **GRUB`_`CMDLINE`_`DEFAULT=**
- If using Syslinux, edit */boot/syslinux.cfg*, and add them to the APPEND line.
- If using systemd-boot, edit your loader entry, and append them to the end of the linux line.

The following settings are recommended to increase security.

This section originally recommended to apply various slub`_`debug options; however, due to Linux deciding to implicitly disable kernel pointer hashing when using this option, in addition to several other issues with these features, they can no longer be recommended. Users are instead advised to use init`_`on`_`free as a replacement for memory poisoning and linux-hardened’s slab canaries in place of redzoning. If slub`_`debug is in use for anything other than debugging, it is highly recommended to remove it immediately.

## Kernel Self-Protection
    
1) slab_normerge

This disables slab merging, which significantly increase the difficulty of heap exploitation by preventing overwriting objects from merged caches and by making it harder to influence slab cheche layout.

2) init_on_alloc=1
3) init_on_free=1

This enables zeroing of memory during alloctation and free time, which can help mitigate use-after-free vulnerabilities and erase sensitive information in memory.

4) page_alloc.shuffle=-18

This option randomizes page allocator freelists, improving security by making page allocations less predictable. This also improves performance.

5) *pti=on*

This enables Kernel Page Table Isolation, which mitigates Meltdown and prevents some KASLR bypasses.

6) *randomize_kstack_offset=on*

This option randomises the kernel stack offset on each syscall, which makes attacks that rely on deterministic kernel stack layout significantly more difficult, such as the exploitation of CVE-2019-18683.

7) *vsycall=none*

This disables vsyscalls, as they are obsolete and have been replaced with vDSO. vsyscalls are also at fixed addresses in memory, making them a potential target for ROP attacks.

8) *debugfs=off*

This disables debugfs, which exposes a lot of sensitive information about the kernel.

9) *oops=panic*

This only allows kernel modules that have been signed with a valid key to be loaded, which increases security by making it much harder to load a malicious kernel module. This prevents all out-of-tree kernel modules, including DKMS modules from being loaded unless you have signed them, meaning that modules such as the VirtualBox or Nvidia drivers may not be usable, although that may not be important, depending on your setup.

10) *lockdown=configdentiality*

The kernel lockdown LSM can eliminate many methods that user space code could abuse to escalate to kernel privileges and extract sensitive information. This LSM is necessary to implement a clear security boundary between user space and the kernel. The above option enables this feature in confidentiality mode, the strictest option. This implies module.sig`_`enforce=1.

11) *mce=0*

This causes the kernel to panic on uncorrectable errors in ECC memory which could be exploited. This is unnecessary for systems without ECC memory.

12) *quiet loglevel=0*

These parameters prevnet information leaks during boot and must be used in combination with the kernel.printk sysctl documented above.

## CPU Mitigations

It is best to enable all CPU mitigations that are applicable to your CPU as to ensure that you are not affected by known vulnerabilities. This is a list that enables all built-in mitigations:

1) *spectre_v2=on*
2) *spec_store_bypass_disable=on*
3) *tsx=off*
4) *tsx_async_abort=full,nosmt*
5) *mds=full,nosmt*
6) *l1tf=full,force*
7) *nosmt=force*
8) *kvm.nx_huge_pages=force*

You must research the CPU vulnerabilities that your system is affected by and apply a selection of the above mitigations accordingly. Keep in mind that you will need to install microcode updates to be fully protected from these vulnerabilities. All of these may cause a significant performance decrease.

## Result

If you have followed all of the above recommendations, excluding your specific CPU mitigations, you will have:

1) *slab_nomerge*
2) *init_on_alloc=1*
3) *init_on_free=1*
4) *page_alloc.shuffle=1* 
5) *pti=on*
6) *vsyscall=none*
7) *debugfs=off*
8) *oops=panic*
9) *module.sig_enforce=1*
10) *lockdown=confidentiality*
11) *mce=0* 
12) *quiet* 
13) *loglevel=0*

You may need to regenerate your GRUB configuration file to apply these if using GRUB as your bootloader.

## HidePID

*/proc* is a pseudo-filesystem that contains information about all processes currently running on the system. By default, this is accessible to all users, which can allow an attacker to spy on other processes. To permit users to only see their own processes and not those of other users, you must mount */proc* with the **hidepid=2**,**gid=proc** mount options. **gid=proc** exempts the proc group from this feature so you can whitelist specific users or processes. One way to add these mount options is to edit */etc/fstab* and add:

```markdown
proc /proc proc nosuid,nodev,noexec,hidepid=2,gid=proc 0 0
```
systemd-logind still needs to see other users' processes, so for user sessions to work correctly on a systemd system, you must create */etc/systemd/system/systemd-logind.service.d/hidepid.conf* and add: 

```markdown
[Service]
SupplementaryGroups=proc
```

## Kernel Attack Surface Reduction

It is best to disable any functionality that is not absolutely required as to minimise potential kernel attack surface. These features do not necessarily have to be dangerous; they could simply be benign code that is removed to reduce attack surface. Never disable random things that you don't understand. The following are some examples that may be of use, depending on your setup.

## Boot Parameters

Boot parameters can often be used to reduce attack surface. One such example is:

- *ipv6.disable=1*

This disables the entire IPv6 stack which may not be required if you have not migrated to it. Do not use this boot parameter if you are using IPv6.

## Blacklisting Kernel modules

The kernel allows unprivileged users to indirectly cause certain modules to be loaded via module auto-loading. This allows an attacker to auto-load a vulnerable module which is then exploited. One such example is [CVE-2017-6074](https://github.com/xairy/kernel-exploits/tree/master/CVE-2017-6074), in which an attacker could trigger the DCCP kernel module to be loaded by initiating a DCCP connection and then exploit a vulnerability in said kernel module.

Specific kernel modules can be blacklisted by inserting files into /etc/modprobe.d with instructions on which kernel modules to blacklist
