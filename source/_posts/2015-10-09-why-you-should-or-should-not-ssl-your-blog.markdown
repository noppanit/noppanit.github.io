---
layout: post
title: "Why you should or should not SSL your blog"
date: 2015-10-09 17:02:25 -0400
comments: true
categories: 
---

After I switched to Octopress, I knew that I wanted to write about performance and SSL. Those are the main reasons why I switched. 

Last year, Google [announced][1] that they will include Https as a single in their ranking. So, if you want to be the cool kid, go and SSL your site now. But what does SSL really do to your site? Have you seen that in action? I only know that from reading all the blog posts about this. In this blog, I'll show you what SSL does to your site. 

Thanks to my friend [Suksant][2] who helped me conducting the test. 

## What will you need?

1. [Wireshare][3] is a network protocal analysis.

## Simple website.

I've created a simple [site][4] that you can fake login form. So, you can go ahead and deploy that to your heroku. I chose Heroku as the platform of choice because you can try the site with and without SSL. 

## Setup your wireshark

There's a couple things you need to do before you can capture the password.

1. Open your wireshark and go to *Capture -> Interfaces* and click *en0* that should be your Wifi connection.

{% img wp-content/uploads/2015/10/wireshark-setup-interface.jpg Wireshark Interfaces %}

Then click 'Start' to capture the packets

2. In the *Filter* section, put this *frame contains topsecret* (That's going to be your password)

{% img wp-content/uploads/2015/10/wireshark-filter.jpg Wireshark filter %}

## Capture the password

1. I deployed the application [here][5]. Go ahead and enter "username" in username and "topsecretpassword" in password It could be anything. Try to check if the URL is not SSL.

{% img wp-content/uploads/2015/10/form-to-submit-without-ssl.jpg Form submit %}

2. Once you've submitted your password, you should see that Wireshark has captured something already.

{% img wp-content/uploads/2015/10/wireshark-captured-password.jpg Wireshark with password %}

without even trying to do anything hard. You can clearly see the password.

## Now with SSL.

1. Change your URL to be *https:*
2. You will not find anything with your password on Wireshark

## What gives?

In conclusion, what have we learned here? SSL encrypts everything being sent to the server will be encrypted. It's safer and make the site more trustworthy. However, if you're just running a blog you probably won't need SSL. If you have a website that capture anything from the user then big 'YES' you need SSL. For me, I just want to be a cool kid so I SSLed my site. 


 [1]: http://googlewebmastercentral.blogspot.com/2014/08/https-as-ranking-signal.html
 [2]: https://twitter.com/suksant
 [3]: https://www.wireshark.org/
 [4]: https://github.com/noppanit/SSL-Show-and-tell
 [5]: http://ssl-show-and-tell.herokuapp.com/login
