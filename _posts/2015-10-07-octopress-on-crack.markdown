---
layout: post
title: "Octopress on crack"
date: 2015-10-07 22:44:22 -0400
comments: true
categories: 
 - performance

---

I believe you will find a ton of blogs writing about makeing Octopress faster. I believe nearly everyone who migrated their blog to Octopress, the first post would be the migration and the next would be performance tuning. I want to be the cool kid so here you go. 

Once you got out of WordPress now there's much more you can do about your performance. But before you start, nothing can be done before you have the baseline numbers

## Before

Here's my before performance from Google PageSpeed.

{% img /wp-content/uploads/2015/10/google-pagespeed-before.jpg Google PageSpeed before performance %}

And from webpagetest.org

{% img /wp-content/uploads/2015/10/before-perf-noppanit-com.jpg Webpagetest before performance %}

In a nutshell, my page starts to render in *2.4s* and finishes in *4s*. Yikes! I wouldn't even want to wait for my site to load. Let's see where's the lowest hanging fruit. 

## What about images?

A picture is worth a thousand words. Who doesn't like image right? Also, I tend to have a lot of screenshots and they're all PNGs. And they tend to be big. As they're all screenshots so I don't really care about losing some of the quality so I convert them to be jpg. If you're using OSX, there's a command that you can run. 

```
sips -s format jpeg your_png.png --out your_pic.jpg
```

Now what can we do to reduce the size? There's lots of tools out there that you can just throw your image in and it will compress the image for you. I use [compressor.io][1]. It's really good. Just try throwing your image in there and see what happens. Compressor.io can reduce my images up to 60% and that saves a lot of bandwidth.

## Minify CSS/JS

Fortunetely, I use [Cloudflare][2] and they have the feature to minify that for you. So, I just flipped the switch and it works like magic. 

## Browser caching

Going back to what Google PageSpeed tells us again. It complaints about *Leverage browser caching*. I'm lucky again because in Cloudflare you can set the cache to be 30 days and that seems to be ok for Google.

## Inline CSS

I use [Slash][3] theme and when I look at the CSS, it's only 22K. So why not just inline it and save one more request for the browser. So, in *_includes/head.html* you can change the line that includes your stylesheet to be. 

{% codeblock html %}
	<style>
		{\% include screen.css %} # delete '\' in front of % before you paste this snippet
	</style>
{% endcodeblock %}

This might be different from theme to theme but it shouldn't be difficult to find that out. 

## After

Now, let's have a quick look at the after performance. 

Here's my after performance from Google PageSpeed.

{% img /wp-content/uploads/2015/10/google-pagespeed-after.jpg Google PageSpeed after %}

It's a lot better now but there's one tiny problem with mobile which I'll write another blog post about that.

Let's have a look at webpagetest now.

{% img /wp-content/uploads/2015/10/webpagetest-after.jpg Webpagetest After %}

A lot better! It's still not the best but now my page loads within *0.5s* and finishes in *1.9s*. However, there's still a lot to work on mobile.

I could shead about 200ms by not using SSL but I'm willing to compromise that with a little bit of security.

## What's next

I'd like to try hosting the images on S3 to see if that would speed up the load time. And I want to make the images responsive for mobile.

 [1]: https://compressor.io/
 [2]: https://www.cloudflare.com/
 [3]: https://github.com/tommy351/Octopress-Theme-Slash

