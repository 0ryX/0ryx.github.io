+++
title = "Taking Back From MicroSoft"
date = "2025-09-20"
+++

# Taking Back From MicroSoft

Windows 10 is coming to the end of it's life span and even though I haven't used Windows or their products in over a decade - I am getting a lot of friends coming up to me and asking how to install Windows 11 for free. Now my first reaction to situations like this is always "why don't you give Linux a try?"

![Bearnie-Linux](static/img/Bearnie-Linux.png)

## Endless Adds and Paywals

Windows is full of bloat and spyware and I am convinced that Windows Defender is malware 🤣 and I could never go back to using
this OS, even if you paid me! The internet runs on Linux and you should probably learn to use it, especially now that Windows 11 ships with WSL. This was a major talking point around the time and shipment of Windows 11 back in 2021. So that's nice I guess, if you wanted to run Linux within Windows 11 it's now easier to do then ever. But that's not why we're here. Today we will be using a trick I've been using when setting up a homelab for exploit development and research.

## Getting Started

Now Windows doesn't want anyone getting anything for free so I heard that these are actually "test" keys and not the same a your actual 
activation key you would get if you purchased Windows 11 but it's worked for me and I think it'll work for you just the same. Head over to the [Windows11 iso download](https://www.microsoft.com/en-us/software-download/windows11) page and download the disk image for x86. This is the disk image you'll need to flash to a bootable USB, either using [Etcher](https://etcher.balena.io/), [Rufus](https://rufus.ie/en/), [Raspberry Pi Imager](https://projects-raspberry.com/raspberry-pi-imager/) which is great for flashing SD cards and saves a step, bypassing the need to install the ISO first. Although I cannot say that they have Windows 11 available in their list of available ISO files. Rufus is for Wndows only and Etcher is for everything else. we'll be doing things the Linux way and use the dd command. 

```bash
dd if="./filename.iso" of="/dev/sdb" status="progress" conv="fsync"
```

To find out which ```/dev/sdb``` you'll use you need to use the command 

```bash
lsblk
NAME               MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
nvme0n1            259:0    0 476.9G  0 disk  
├─nvme0n1p1        259:1    0     1G  0 part  /boot
├─nvme0n1p2        259:2    0    47G  0 part  
│ └─root           254:0    0    47G  0 crypt /
└─nvme0n1p3        259:3    0 428.9G  0 part  
  └─ainstnvme0n1p3 254:1    0 428.9G  0 crypt /home
``` 
but as you can see here I do not have a usb device so this output is useless for you to view. Where you see **nvme0n1** there would also be a **nvme0n2** and that is what you would put in the **of="/dev/sdb"** 
Once all that has finished you will then need to restart your computer and boot into the boot order on you system. You can also look this up for your computer, usually it's holding down F11 while your computer starts or the options key on macbooks.

## The Fun Part

### Windows 11

Windows 11
|Product | KMS Key |
|Windows 11 Education N |2WH4N-8QGBV-H22JP-CT43Q-MDWWJ |
|Windows 11 Education |NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 |
|Windows 11 Enterprise G N |44RPN-FTY23-9VTTB-MP9BX-T84FV |
|Windows 11 Enterprise G |YYVX9-NTFWV-6MDM3-9PT4T-4M68B |
|Windows 11 Enterprise N |DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 |
|Windows 11 Enterprise |NPPR9-FWDCX-D2C8J-H872K-2YT43 |
|Windows 11 Pro Education N |YVWGF-BXNMC-HTQYQ-CPQ99-66QFC |
|Windows 11 Pro Education |6TP4R-GNPTD-KYYHQ-7B7DP-J447Y |
|Windows 11 Pro N |MH37W-N47XK-V7XM9-C7227-GCQG9 |
|Windows 11 Pro for Workstations N |9FNHH-K3HBT-3W4TD-6383H-6XYWF |
|Windows 11 Pro for Workstations |NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J |
|Windows 11 Pro |W269N-WFGWX-YVC9B-4J6C9-T83GX |

Select a key from the above table, I have collected a few keys for you to test but if you cannot find a working key you can always google kms keys for windows 11 and see what you get. It's not hard to find working keys online. 

### Windows KMS Setup

**Install kms key**
Open an elevated command prompt(as administrator)
```bash
slmgr.vbs /ipk <kms-key>
slmgr.vbs /skms <server:port>
slmgr.vbs /ato
```

where <kms-key> would be your key from above, <server:port> you'll have to look up on google. I found [kms servers](https://gist.github.com/Zibri/69d55039e5354100d2f8a053cbe64c5a) here but they may be out dated. do not stop trying until you find one that works. That's how hacking works. and then your final command will be the */ato* Now that all said and done you just told microsoft to go fuck themselves with their update bullshit but you should probably just switch to Linux anyways 🐧

- 0ryX
