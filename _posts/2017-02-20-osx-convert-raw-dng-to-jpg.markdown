---
layout: post
title: "OSX convert raw DNG to JPG"
date: 2017-02-20 13:23:19 +0700
comments: true
categories: [photography, command-line]
---

## Problem

I like shooting raw and I'm still doing it. However, there's a time when I had to Airdrop jpeg to my phone and I didn't want to go into the trouble of import all the photos to Lightroom and export them again. So I turned to Google and here's what I found. 

I'm lazy and I do most things in my terminal. Here's the way you can do the same if you want to just quickly convert raw images to jpg. 

## Solution

1. You need [dcraw](http://www.cybercom.net/~dcoffin/dcraw) which you can use `brew` to install

``` bash

brew install dcraw

```

2. You need [cjpeg](http://www.ijg.org/) which is from `libjpeg` so most likely you will have that already. Otherwise you can install by following these steps from [here](http://www.mutaku.com/wp/index.php/2011/02/cook-your-raw-photos-into-jpeg-with-linux/)

3. Go into your raw photos folder and run this command

``` bash
for i in *; do dcraw -c "$i" | cjpeg -quality 100 -optimize -progressive > $(echo $(basename "$i" ".crw").jpg); done
```
 
This command will loop through all the files inside the folder and run `dcraw` command for each file then pipe it through `cjpeg` and same to the original name with `jpg` extension. 

I didn't really check the quality as I just wanted to quickly post on Twitter.

### Reference
1. [http://www.mutaku.com/wp/index.php/2011/02/cook-your-raw-photos-into-jpeg-with-linux/](http://www.mutaku.com/wp/index.php/2011/02/cook-your-raw-photos-into-jpeg-with-linux/)
