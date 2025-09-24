+++
title = "Taking Back From MicroSoft"
date = "2025-09-20"
draft = true
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


