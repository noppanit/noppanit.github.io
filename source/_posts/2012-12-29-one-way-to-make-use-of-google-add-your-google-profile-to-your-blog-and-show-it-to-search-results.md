---
title: 'One way to make use of Google+ : Add your Google+ profile to your blog and show it to search results'
author: Noppanit Charassinvichai
layout: post
permalink: /one-way-to-make-use-of-google-add-your-google-profile-to-your-blog-and-show-it-to-search-results/
dsq_thread_id:
  - 998932779
categories:
  - Knowledges
---
So, I guess you must have heard Google+. But yet you can&#8217;t figure out how to do it, I don&#8217;t have many friends on Google+, all my friends are in Facebook or Twitter. But while I have been blogging about some stuff, I just thought I have seen some people faces next to google search results before. How come I don&#8217;t have one. Well, now I can think of one way to use Google+ to show my picture next to the content that I contribute. 

Google has a process called [Google Authorship][1] to verify that you can be linked to the content you contributed. After you have completed this, it will show in your profile has your work email. So, now you can start building your Google+ profile by adding some nice profile picture and add some friends, follow some interesting people. 

If you use wordpress then you&#8217;re lucky you can just add your google+ profile to your about page like this. The **rel=&#8221;me&#8221;** is the most important one.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          <a href="https://profiles.google.com/your_ID" "rel="me">My Profile</a>
        </div>
      </td>
    </tr>
  </table>
</div>

Then wordpress will handle the rest by adding **rel=&#8221;author&#8221;** to your post

<img src="http://www.noppanit.com/wp-content/uploads/2012/12/Screen-shot-2012-12-29-at-22.44.11.png" alt="Authorship" class="alignnone size-medium wp-image-942" />

You can inspect the html on the link of your name, you should see **rel=&#8221;author&#8221;** in the url

Once you have completed this, Google has this nice cool tool to check your [rich snippet code][2]. You should see something like this.

<img src="http://www.noppanit.com/wp-content/uploads/2012/12/Screen-shot-2012-12-29-at-22.45.59.png" alt="Authorship" class="alignnone size-medium wp-image-943" />

If it&#8217;s said **Unverified** then just click on it and Google will tell you how to make it green. It&#8217;s like a little TDD. 

Then give it a couple hours or days until Google wakes up.

**Edited** I would strongly suggest to install Yoast WordPress SEO plugin if you&#8217;re using wordpress. In the tag &#8220;Titles & Metas&#8221; You can also specify your google+ profile and a lot of features you can use to make your site SEO friendly.

 [1]: https://plus.google.com/authorship "Google Authorship"
 [2]: http://www.google.com/webmasters/tools/richsnippets "rich snippets"