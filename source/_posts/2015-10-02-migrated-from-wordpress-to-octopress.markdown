---
layout: post
title: "Migrated from WordPress to Octopress"
date: 2015-10-02 15:39:34 -0400
comments: true
permalink: /migrated-from-wordpress-to-octopress
categories: 
  - Knowledges
tags:
  - performance
  - hacking
---

I have heard so much about Octopress but I haven't got the time to actually get to know what it can offer. Finally, this week I finally made the time to migrate my blog to Octopress and I love it. Thanks to [HabitRPG][1] and Pomodoro (These will be another blog).

Don't get me wrong I still love WordPress. In fact, I'm actually a WordPress Developer myself. However, for the post 9 years that I have noppanit.com I haven't really used any of the WordPress features. What I really need is just a blog that I can write and publish. Octopress serves me well.

I'd like to thank [Scott Muc][7] that inspired me for this migration.

Here are some of the reasons why I migrated my blog to Octopress.

## Hosting

Having a hosting is nice but it would be nicer if I don't have to maintain it especially when I have to contact the customer service. Octopress gives you various choices of how to deploy your blog to. I chose to deploy my blog to Github as it's the fatest and easiest option. I don't need anything else just github.com which I use it everyday and a couple of command lines. Now, I don't have to worry about upgrading my plugins or WordPress anymore. However, usually my hosting would do it for me if I haven't updated for a long time. 

## Writing code snippet

I think this is personal, because any good WordPress developer might argue that you can do the same in WordPress editor which I agree. However, having written a lot of MarkDown on Github I'm just used to use codeblock like this.

```
// something amazing
```

WordPress gets on my nerves everytime when my blog crashed and all the identations of my code blocks failed.

## Performance

There's nothing faster than plain HTML. Well, that depends on your server. After deploying to Github pages all my posts are backed up and secured in Github. Then after that, it's up to Github how fast they can deliver my HTML to the browser which I think it's pretty fast.
 
One can argue that having WordPress properly tuned then you can get the same performance out of it as well. However, I just believe that Octopress is just easier to make changes. One reason relates to how limited your hosting can offer as well. Some of them are quite limited of how much you can do with the webserver without the dedicated server.

Here's some of the performance breakdown which I haven't tuned. 

### Before

[noppanit.com performance][5]

{% img /wp-content/uploads/2015/10/before-perf-noppanit-com.jpg %}

### After

[noppanit.github.io performance][6]

{% img /wp-content/uploads/2015/10/after-perf-noppanit-com.jpg %}

The numbers don't lie. After I switched to Octopress, my website renders in *1.392s*. That's without doing anything else. I'm going to write another blog post how I tune my blog to get the most out of it. WordPress is a great framework but when it comes to performance tuning, it requires a lot of hacking.

I have attached the link to [webpagetest][4] as well in case anybody is interested in more details. 

## No Database

Everybody knows that maintaining a database is a headache. Everytime you need to upgrade WordPress you need to backup database just in case something goes wrong and when you want to transfer the site you will need to do some hack to ensure that the data is transfered properly. However, one might argue that not having the database for Octopress can cause another migration a problem. If in the next year or two another blog framework comes along how will we integrate the data? I guess that's the same question for WordPress as well. Personally, when the time comes I think somebody will create a plugin to transfer that. Open source is the best.

## Problems

Here's some of the problems I have encountered during the migration. All of them were minors and it didn't take much time to resolve them.

1. Code snippet wasn't converted correctly. Some of the `<code` block got transfered during the export as pure HTML. So, I went through all my posts and convert it manually to Markdown format. It's a plus for me so I took the opportunity to clean up old posts.
2. One of my posts was encoded in UTF-8. I got lucky because it's just one post. So, I didn't have any problem with it. 
3. Disqus comment wasn't visible. This is because during the export `comments: true` wasn't added so I had to do it manually. This is my command to get it done.

``` bash
brew install gsed
find . -type f -exec gsed -i "s/\(title: .*\)/\1\ncomments: true/" {} \;
```

You need to run this in your posts directory. It will add `comments: true` after the `title`

I got really lucky that I didn't have many issues during the migration. 

## What tool did I use

1. [wordpress-to-jekyll-exporter][2] This is an awesome tool. One click and I get everything including all the pictures I uploaded.
2. [Cloudflare][8] This is for my SSL.

## SSL

This is just me. You can do the same for WordPress as well. I think every blog I came across about migrating to Octopress on Github pages mentioned having SSL to their website. It's the perfect solution with Cloudflare but it's the best free option I can find on the Internet. If Github decides to support full SSL later, I'd be happy to switch.

## It's not for everyone

Octopress claims to be blogging framework for hackers and it's true. You can't just give Octopress to non-technical people and expect them to be fluent. I think that's what WordPress's good for. You need to be familiar with git and command line to get it setup and deployed.

## Insipiration

1. [Migrating from WordPress to Octopress][3]


 [1]: https://habitica.com
 [2]: https://github.com/benbalter/wordpress-to-jekyll-exporter
 [3]: http://jason.pureconcepts.net/2013/01/migrating-wordpress-octopress/
 [4]: http://webpagetest.org
 [5]: http://www.webpagetest.org/result/151002_33_7N6/1/details/
 [6]: http://www.webpagetest.org/result/151002_NG_7P4/2/details/
 [7]: https://twitter.com/ScottMuc
 [8]: https://www.cloudflare.com/
