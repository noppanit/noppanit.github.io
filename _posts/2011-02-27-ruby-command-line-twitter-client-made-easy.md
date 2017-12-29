---
title: 'Ruby : Command-line twitter client made easy'
comments: true
author: Noppanit Charassinvichai
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

``` bash

gem install twitter_oauth

```

If you need to know what OAuth is, I suggest you read this great article <http://hueniverse.com/2007/10/beginners-guide-to-oauth-part-i-overview/>

Basically, OAuth is a helper to help you login to twitter.com without exposing or sending your login details over the Internet. It&#8217;s like public and private key. But If you&#8217;re doing for a single-user like me, then you don&#8217;t have to worry anything about this. You just need 4 keys to access twitter APIs. 

First, you will need to register your app with Twitter. Go to this page and follow the steps. <http://twitter.com/apps>

Now you will need four keys to work, go to this page to get all those keys.  
<https://dev.twitter.com/apps>

You will want, consumer\_key, consumer\_secret. You can get them from your application setting page, then click on My Access Token on the right-hand sided bar. Note down Access Token and Access Token Secret. Then you&#8217;re good to go.


``` ruby

#!/usr/bin/env ruby

require 'rubygems'
require 'twitter_oauth'

TWITTER_CONSUMER_KEY = 'Your Consumer Key'
TWITTER_CONSUMER_SECRET = 'Your Consumer Secret'
TWITTER_ACCESS_TOKEN = 'Your Access Token'
TWITTER_ACCESS_SECRET = 'Your Access Token Secret'

client = TwitterOAuth::Client.new(
  :consumer_key => TWITTER_CONSUMER_KEY,
  :consumer_secret => TWITTER_CONSUMER_SECRET,
  :token => TWITTER_ACCESS_TOKEN,
  :secret => TWITTER_ACCESS_SECRET)

case ARGV[]
 when "-l"
  timeline = client.home_timeline()
  timeline = timeline.reverse
  timeline.each{ |tweet| 
    puts tweet['text'] + " @FROM #{tweet['user']['name']}"
    puts "\n"
  }
 when "-u"
  if ARGV[1].nil?
    puts "Please enter your status:"
    status = STDIN.readline.chomp
    client.update("#{status}")
  else
    client.update("#{ARGV[1]}")
  end
 when "-m"
  mentions = client.mentions()
  mentions = mentions.reverse
  mentions.each{ |tweet| 
    puts tweet['text'] + " @FROM #{tweet['user']['name']}"
    puts "\n"
  }
end

```

This is just an example of my application which I use it on terminal. You can run the app by typing

``` bash

ruby thenameofthisapplication.rb

```

or you can use symbolic link to /usr/bin and type

``` bash

./thenameofthisapplication

```

It&#8217;s totally up to you. 

The Ruby API I used in this example is from this <https://github.com/moomerman/twitter_oauth>

And this is the Twitter API that you can have a look.  
<http://apiwiki.twitter.com/w/page/22554679/Twitter-API-Documentation>

In this way, you can design your application to be whatever you want and when you&#8217;re at work, you&#8217;ll be on terminal on the time. 

Good luck!
