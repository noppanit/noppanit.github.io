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

I have heard so much about Octopress and I haven't got the time to actually get to know what it can do. This week I finally make the time to migrate my blog to Octopress and I love it. Thanks to [HabitRPG][1] and Pomodoro. 

Don't get me wrong I still love WordPress. In fact, I'm actually a WordPress Developer myself. However, for the post 9 years that I have noppanit.com I haven't really used any of the WordPress features. What I really need is just a blog that I can write and publish. Octopress serves me well.

Here are some of the reasons why I migrated my blog to Octopress

## Hosting
Hosting is nice but it would be nicer if I don't have to maintain. I chose to deploy my blog to Github as it's the fatest option and I don't need anything else just github.com which I use it everyday. Now, I don't have to worry about upgrading my plugins or WordPress anymore, even though usually my hosting would do it for me if I haven't updated for a long time. 

Octopress makes it really easy to upload anything. 

## Writing code
I think this is personal, because any good WordPress developer might argue that you can do the same in WordPress editor which I agree. However, having written a lot of MarkDown on Github I'm just used to use codeblock like this. 

## Performance
There's nothing faster than plain HTML. All my stuff is backed up and secure in Github. 

Here's some of the performance breakdown which I haven't tuned. 

One can argue that WordPress can do the same as well, but it's just a lot easier in Octopress.

### Before

{% img /wp-content/uploads/2015/10/before-perf-noppanit-com.png %}

## No Database
Everybody knows that maintaining a database is a headache. Everytime you need to upgrade WordPress you need to backup database just in case something goes wrong and when you want to transfer the site you will need to do some hack to ensure that the data is there properly. However, one might argue that not having the database for Octopress can cause another migration a hassle. If in the next year or two another blog framework comes along how will we integrate the data? I guess that's the same question for WordPress as well. And somebody has done something to migrate eventually.

# Problems

1. Code snippet wasn't converted correctly. Some of the `<code` block got transfered during the export as pure HTML. So, I went through all my posts and convert it manually to Markdown format. It's a plus for me so I took the opportunity to clean up old posts.
2. One of my posts was encoded in UTF-8. I got lucky because it's just one post. So, I didn't have any problem with it. 
3. Disqus comment wasn't visible. This is because during the export `comments: true` wasn't added so I had to do it manually. This is my command.

``` bash
find . -type f -exec gsed -i "s/\(title: .*\)/\1\ncomments: true/" {} \;
```

You need to run this in your posts directory. It will add `comments: true` after `title`

I got really lucky that I didn't have many issues during the migration. 

# What tool did I use
1. [wordpress-to-jekyll-exporter][2]

This is an awesome tool. One click and I get everything including all the pictures I uploaded.

# It's not for everyone

Octopress claims to be blogging framework for hackers and it's true. You can't just give Octopress to non-technical people and expect them to be fluent. I think that's what WordPress's good for. You need to be familiar with Git and command line to get it setup and deploy. After using it for a week, I really like it.

# Insipiration
1. [Migrating from WordPress to Octopress][3]

Performance for noppanit.com
http://www.webpagetest.org/result/151002_33_7N6/1/details/

Performance for noppanit.github.io
http://www.webpagetest.org/result/151002_NG_7P4/2/details/


 [1]: https://habitica.com
 [2]: https://github.com/benbalter/wordpress-to-jekyll-exporter
 [3]: http://jason.pureconcepts.net/2013/01/migrating-wordpress-octopress/
