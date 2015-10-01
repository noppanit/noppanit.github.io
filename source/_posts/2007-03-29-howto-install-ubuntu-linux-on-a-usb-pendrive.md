---
title: 'HowTo : Install Ubuntu Linux on a USB Pendrive'
author: Noppanit Charassinvichai
layout: post
permalink: /howto-install-ubuntu-linux-on-a-usb-pendrive/
dsq_thread_id:
  - 207487888
categories:
  - Knowledges
---
Someday, I woke up and browse to site [www.astalavista.com][1] I found this topic, I immediately interesting on it. Because I used to use Ubuntu to work before, and I have USB, most importance I encountered with the situation to use Linux LIVE CD to boot and backup all my work in windows XP, So I think this topic is very useful.

This tutorial will show how-to install Ubuntu on a usb stick. Even though this tutorial uses Ubuntu as its base distribution, you could virtually use any type of Linux liveCD distribution.

Being able to run Linux out of a usb bar is a great way to enjoy the live CD experience (being able to use Linux on any computer you might get by) and the big advantage of being easier to carry around than a CD.

## 1. Requirements

In order to reproduce this tutorial, you will need a few items such as:

  * a ubuntu liveCD
  * a usb bar of at least 1G
  * a running Linux operating system

Now that you have all this, it is time to prepare you USB bar do host the Ubuntu liveCD files.

## 2. Setting up the USB disk

### 2.1. Finding the device

In the first place, you need to plug your usb drive and check under which device it is associated. To find out the device, run:

> $ sudo fdisk -l

On my system, the device appears as being */dev/sdb*, I will therefore use /dev/sdb as a reference for this tutorial, please replace it accordingly to your system (might be sda, sdc &#8230;).  
Once you found your device, you are going to create the partitions.

<p class="warning">
  Using the wrong device name might destroy your system partition, please double check
</p>

### 2.2. Making the partitions

Make sure every of your already mounted partition are unmounted:

> $sudo umount /dev/sdb1

and then launch **fdisk**, a tool to edit partition under linux:

> sudo fdisk /dev/sdb

We are going delete all the partition and then create 2 new partition: one fat partition of 750M which will host the files from the live CD iso, and the rest on another partition.

At fdisk prompt type *d x* where x is the partition number (you can simply type d if you only have one partition), then:

  * *n* to create a new partition
  * *p* to make it primary
  * *1* so it is the first primary partition
  * Accept the default or type *1* to start from the first cylinder
  * *+750M* to make it 750 Meg big
  * *a* to toggle the partition active for boot
  * *1* to choose the 1 partition
  * *t* to change the partition type
  * *6* to set it to FAT16

Now we have out first partition set up, let&#8217;s create the second one:

  * *n* to create yet again a new partition
  * *p* to make it primary
  * *2* to be the second partition
  * Accept the default by typing Enter
  * Accept the default to make your partition as big as possible
  * Finally, type *w* to write the change to your usb pendrive

Partitions are now created, let&#8217;s format them.

### 2.3. Formatting the partitions

The first partition is going to be formated as a FAT filesystem of size 16 and we are going to attribute it the label &#8220;liveusb&#8221;.

> $ sudo mkfs.vfat -F 16 -n liveusb /dev/sdb1

The second partition is going to be of type ext2 with a blocksize of 4096 bytes and the label **casper-rw**. Mind that it has to be labeled as *casper-rw* otherwise the tutorial won&#8217;t work!.

> $ sudo mkfs.ext2 -b 4096 -L casper-rw /dev/sdb2

At this stage, our usb pendrive is ready to host the liveCD image. Now, let&#8217;s copy the files to the usb bar.

## 3. Installing Ubuntu on the USB stick

### 3.1. Mounting Ubuntu liveCd image

In the first place we need to mount our ubuntu iso. Depending if you have the .iso file or the CD, there is 2 different ways of mounting it.

#### 3.1.1. Mounting from the CD

People using Ubuntu or any other user-friendly distro, might just have to insert the cd and it will be mounted automatically. If this is not the case:

> $ sudo mount /media/cdrom

should mount it.

#### 3.1.2. Mounting from an .iso image file

We will need to create a temporary directory, let say */tmp/ubuntu-livecd* and then mount our iso (I will be using a feisty fawn iso).

> $ mkdir /tmp/ubuntu-livecd  
> $ sudo mount -o loop /path/to/feisty-desktop-i386.iso /tmp/ubuntu-livecd

Once the cd image is ready, it is time to mount the newly created usb bar partitions:

### 3.2. Mounting the usb bar partitions

Same here, you might be able to get both your partition by simply replugging the usb pendrive, partition might appears as: */media/liveusb* and */media/casper-rw*. If this is not the case, then you will need to mount them manually:

> $ mkdir /tmp/liveusb  
> $ sudo mount /dev/sdb1 /tmp/liveusb

All the partitions we need are now mounted, let&#8217;s copy the files.

### 3.3. Copying the files to the usb bar

Let positionned yourself on the CD image directory (in my case: /tmp/ubuntu-livecd , but it might be /media/cdrom , and copy at the root of your usb first partition:

  * the directories: &#8216;casper&#8217;, &#8216;disctree&#8217;, &#8216;dists&#8217;, &#8216;install&#8217;, &#8216;pics&#8217;, &#8216;pool&#8217;, &#8216;preseed&#8217;, &#8216;.disk&#8217;
  * The content of directory &#8216;isolinux&#8217;
  * and files &#8216;md5sum.txt&#8217;, &#8216;README.diskdefines&#8217;, &#8216;ubuntu.ico&#8217;
  * as well as files: &#8216;casper/vmlinuz&#8217;, &#8216;casper/initrd.gz&#8217; and &#8216;install/mt86plus&#8217;

> $ cd /tmp/ubutu-livecd  
> $ sudo cp -rf casper disctree dists install pics pool preseed .disk isolinux/* md5sum.txt README.diskdefines ubuntu.ico casper/vmlinuz casper/initrd.gz install/mt86plus /media/liveusb/ 

It might complain about symbolic links not being able to create, you can ignore this.

Now let&#8217;s go to the first partition of your usb disk and rename *isolinux.cfg* to *syslinux.cfg*:

> $ cd /tmp/liveusb  
> $ sudo mv isolinux.cfg syslinux.cfg 

change /tmp/liveusb according to your settings

Edit syslinux.cfg so it looks like:  
DEFAULT persistent

GFXBOOT bootlogo

GFXBOOT-BACKGROUND 0xB6875A

APPEND file=preseed/ubuntu.seed boot=casper initrd=initrd.gz ramdisk_size=1048576 root=/dev/ram rw quiet splash &#8212;

LABEL persistent

menu label ^Start Ubuntu in persistent mode

kernel vmlinuz

append file=preseed/ubuntu.seed boot=casper persistent initrd=initrd.gz ramdisk_size=1048576 root=/dev/ram rw quiet splash &#8212;

LABEL live

menu label ^Start or install Ubuntu

kernel vmlinuz

append file=preseed/ubuntu.seed boot=casper initrd=initrd.gz ramdisk_size=1048576 root=/dev/ram rw quiet splash &#8212;

LABEL xforcevesa

menu label Start Ubuntu in safe ^graphics mode

kernel vmlinuz

append file=preseed/ubuntu.seed boot=casper xforcevesa initrd=initrd.gz ramdisk_size=1048576 root=/dev/ram rw quiet splash &#8212;

LABEL check

menu label ^Check CD for defects

kernel vmlinuz

append boot=casper integrity-check initrd=initrd.gz ramdisk_size=1048576 root=/dev/ram rw quiet splash &#8212;

LABEL memtest

menu label ^Memory test

kernel mt86plus

append &#8211;

LABEL hd

menu label ^Boot from first hard disk

localboot 0x80

append &#8211;

DISPLAY isolinux.txt

TIMEOUT 300

PROMPT 1

F1 f1.txt

F2 f2.txt

F3 f3.txt

F4 f4.txt

F5 f5.txt

F6 f6.txt

F7 f7.txt

F8 f8.txt

F9 f9.txt

F0 f10.txt  
Woof, finally we have our usb disk almost usuable. We have a last thing to do: make the usb bootable.

### 3.4. Making the usb bar bootable.

in order to make our usb disk bootable, we need to install *syslinux* and *mtools*:

<p class="shell">
  $ sudo apt-get install syslinux mtools
</p>

And finally unmount /dev/sdb1 and make it bootable:

> $ cd  
> $ sudo umount /tmp/liveusb  
> $ sudo syslinux -f /dev/sdb1 

Here we are, reboot, set your BIOS to boot from the usb bar and enjoy Ubuntu linux from a pendrive

## 4. Troubleshooting

If you are having trouble booting on the usb bar, this might be due to your MBR being corrupted. In order to fix it up, you can use lilo (I installed lilo on my box only for thid purpose).

> $ lilo -M /dev/sdb
> 
> will fix the MBR on device /dev/sdb 

[http://www.debuntu.org/how-to-install-ubuntu-linux-on-usb-bar ][2]

 [1]: http://www.astalavista.com
 [2]: http://www.debuntu.org/how-to-install-ubuntu-linux-on-usb-bar