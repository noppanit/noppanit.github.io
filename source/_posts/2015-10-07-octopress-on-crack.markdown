---
layout: post
title: "Octopress on crack"
date: 2015-10-07 22:44:22 -0400
comments: true
categories: 
---

I believe you will find a ton of websites writing about tuning performance of Octopress. I believe nearly everyone who migrated their blog to Octopress, the first post would be the migration and the next would be performance tuning. I'm doing the same here. 

Once I got out of WordPress now there's much more you can do about your performance. But you should never tune anything unless you have the baseline. 

## Before

Here's my before performance on Google PageSpeed.

{% img /wp-content/uploads/2015/10/google-pagespeed-before.jpg Google PageSpeed before performance %}

And on webpagetest.org

{% img /wp-content/uploads/2015/10/before-perf-noppanit-com.jpg Webpagetest before performance %}

Yikes!

In a nutshell, my page starts to render in *2.4s* and finishes in *4s*. From what I've seen looks like the biggest red flag would be images.

## What about images?

A picture is worth a thousand words. I like my blog to have some images so it won't be too boring. Also, I tend to have a lot of screenshots from my company and they're all PNGs. And PNGs tend to be bigger. As they're all screenshots so I don't really care about losing some of the quality so I convert all of them to be jpg. If you're using OSx, there's a command that you can run. 

```
sips -s format jpeg your_png.png --out your_pic.jpg
```

Now what about compression. There's lots of tools out there that you can just throw your picture in and it will compress your picture for you. I use [compressor.io][1]. It's really good. Just try throwing your image in there and see what happens. Compressor.io can reduce my images up to 60% and that's a lot of bandwidth.

## Minify CSS/JS

Fortunetely, I use [Cloudflare][2] and they have the feature to minify that for you. So, I just flipped the switch and it works like magic. 

## Browser caching

Going back to what Google PageSpeed tells us again. It complaints about *Leverage browser caching*. I'm lucky again because in Cloudflare you can set the time to be 30 days and that seems to be ok for Google. So, I just set the value to be 1 month.

## Inline CSS
I use [Slash][3] theme and when I look at the CSS, it's only 22K. So why not just inline it and save one more request for the browser. So, in *_includes/head.html* you can change the line to your stylesheet to be 

%{ codeblock html
<style>
	{% include screen.css %}
</style>
%}

This might be different from theme to theme but it should be difficult to check your theme. 

## After

Now, let's have a quick look at the after performance. 

Here's my after performance on Google PageSpeed.

{% img /wp-content/uploads/2015/10/google-pagespeed-after.jpg Google PageSpeed after %}

It's a lot better now but there's one tiny problem with mobile but I'll write another blog post about how to performance tune that for mobile. 

Let's have a look at webpagetest now.

{% img /wp-content/uploads/2015/10/webpagetest-after.jpg Webpagetest After %}

A lot better now. It's still not the best but now my page loads within *0.5s* and finishes in *1.9s*. There's still a lot of work to do for mobile. 

## What's next

I'd like to try hosting the images on S3 to see if that would speed up the load time. And I want to make the images responsive for mobile.

 [1]: https://compressor.io/
 [2]: https://www.cloudflare.com/
 [3]: https://github.com/tommy351/Octopress-Theme-Slash

