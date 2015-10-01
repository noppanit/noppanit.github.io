---
title: 'Ruby : Command-line twitter client made easy'
author: Noppanit Charassinvichai
layout: post
permalink: /ruby-command-line-twitter-client-made-easy/
dsq_thread_id:
  - 241424517
categories:
  - Ruby
---
Have you every told off that you&#8217;re playing in your work? Why do you have to open a browser twitter.com to be so obvious that you&#8217;re not doing your job well. Well, you can build a command-line twitter client very easy. So, you will be one of the geeks who use terminal all the time and your boss won&#8217;t know that you&#8217;re on twitter all the time. 

I will start with installing Ruby and Gem, because I wanted to save time building this program from scratch as much as possible. So, a couples of useful gems would be really helpful. 

if you&#8217;re new to ruby and use mac same as me, I suggest you install ruby by following this great article.  
<http://hivelogic.com/articles/ruby-rails-leopard>

You can use a great application of all time like MacPort. 

Ok! gem installed, ruby installed. Let&#8217;s start with installing some gems

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
          gem install twitter_oauth
        </div>
      </td>
    </tr>
  </table>
</div>

If you need to know what OAuth is, I suggest you read this great article <http://hueniverse.com/2007/10/beginners-guide-to-oauth-part-i-overview/>

Basically, OAuth is a helper to help you login to twitter.com without exposing or sending your login details over the Internet. It&#8217;s like public and private key. But If you&#8217;re doing for a single-user like me, then you don&#8217;t have to worry anything about this. You just need 4 keys to access twitter APIs. 

First, you will need to register your app with Twitter. Go to this page and follow the steps. <http://twitter.com/apps>

Now you will need four keys to work, go to this page to get all those keys.  
<https://dev.twitter.com/apps>

You will want, consumer\_key, consumer\_secret. You can get them from your application setting page, then click on My Access Token on the right-hand sided bar. Note down Access Token and Access Token Secret. Then you&#8217;re good to go.

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />33<br />34<br />35<br />36<br />37<br />38<br />39<br />40<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="co1">#!/usr/bin/env ruby</span><br /> <br /> <span class="kw3">require</span> <span class="st0">'rubygems'</span><br /> <span class="kw3">require</span> <span class="st0">'twitter_oauth'</span><br /> <br /> TWITTER_CONSUMER_KEY = <span class="st0">'Your Consumer Key'</span><br /> TWITTER_CONSUMER_SECRET = <span class="st0">'Your Consumer Secret'</span><br /> TWITTER_ACCESS_TOKEN = <span class="st0">'Your Access Token'</span><br /> TWITTER_ACCESS_SECRET = <span class="st0">'Your Access Token Secret'</span><br /> <br /> client = <span class="re2">TwitterOAuth::Client</span>.<span class="me1">new</span><span class="br0">&#40;</span><br /> &nbsp; <span class="re3">:consumer_key</span> <span class="sy0">=></span> TWITTER_CONSUMER_KEY,<br /> &nbsp; <span class="re3">:consumer_secret</span> <span class="sy0">=></span> TWITTER_CONSUMER_SECRET,<br /> &nbsp; <span class="re3">:token</span> <span class="sy0">=></span> TWITTER_ACCESS_TOKEN,<br /> &nbsp; <span class="re3">:secret</span> <span class="sy0">=></span> TWITTER_ACCESS_SECRET<span class="br0">&#41;</span><br /> <br /> <span class="kw1">case</span> ARGV<span class="br0">&#91;</span><span class="nu0"></span><span class="br0">&#93;</span><br /> &nbsp;<span class="kw1">when</span> <span class="st0">"-l"</span><br /> &nbsp; timeline = client.<span class="me1">home_timeline</span><span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; timeline = timeline.<span class="me1">reverse</span><br /> &nbsp; timeline.<span class="me1">each</span><span class="br0">&#123;</span> <span class="sy0">|</span>tweet<span class="sy0">|</span> <br /> &nbsp; &nbsp; <span class="kw3">puts</span> tweet<span class="br0">&#91;</span><span class="st0">'text'</span><span class="br0">&#93;</span> <span class="sy0">+</span> <span class="st0">" @FROM #{tweet['user']['name']}"</span><br /> &nbsp; &nbsp; <span class="kw3">puts</span> <span class="st0">"<span class="es0">\n</span>"</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp;<span class="kw1">when</span> <span class="st0">"-u"</span><br /> &nbsp; <span class="kw1">if</span> ARGV<span class="br0">&#91;</span><span class="nu0">1</span><span class="br0">&#93;</span>.<span class="kw2">nil</span>?<br /> &nbsp; &nbsp; <span class="kw3">puts</span> <span class="st0">"Please enter your status:"</span><br /> &nbsp; &nbsp; status = STDIN.<span class="kw3">readline</span>.<span class="kw3">chomp</span><br /> &nbsp; &nbsp; client.<span class="me1">update</span><span class="br0">&#40;</span><span class="st0">"#{status}"</span><span class="br0">&#41;</span><br /> &nbsp; <span class="kw1">else</span><br /> &nbsp; &nbsp; client.<span class="me1">update</span><span class="br0">&#40;</span><span class="st0">"#{ARGV[1]}"</span><span class="br0">&#41;</span><br /> &nbsp; <span class="kw1">end</span><br /> &nbsp;<span class="kw1">when</span> <span class="st0">"-m"</span><br /> &nbsp; mentions = client.<span class="me1">mentions</span><span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; mentions = mentions.<span class="me1">reverse</span><br /> &nbsp; mentions.<span class="me1">each</span><span class="br0">&#123;</span> <span class="sy0">|</span>tweet<span class="sy0">|</span> <br /> &nbsp; &nbsp; <span class="kw3">puts</span> tweet<span class="br0">&#91;</span><span class="st0">'text'</span><span class="br0">&#93;</span> <span class="sy0">+</span> <span class="st0">" @FROM #{tweet['user']['name']}"</span><br /> &nbsp; &nbsp; <span class="kw3">puts</span> <span class="st0">"<span class="es0">\n</span>"</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="kw1">end</span>
        </div>
      </td>
    </tr>
  </table>
</div>

This is just an example of my application which I use it on terminal. You can run the app by typing

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
          ruby thenameofthisapplication.rb
        </div>
      </td>
    </tr>
  </table>
</div>

or you can use symbolic link to /usr/bin and type

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
          ./thenameofthisapplication
        </div>
      </td>
    </tr>
  </table>
</div>

It&#8217;s totally up to you. 

The Ruby API I used in this example is from this <https://github.com/moomerman/twitter_oauth>

And this is the Twitter API that you can have a look.  
<http://apiwiki.twitter.com/w/page/22554679/Twitter-API-Documentation>

In this way, you can design your application to be whatever you want and when you&#8217;re at work, you&#8217;ll be on terminal on the time. 

Good luck!