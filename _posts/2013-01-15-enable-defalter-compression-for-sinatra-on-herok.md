---
title: Enable Defalter compression for Sinatra on Heroku
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 1026517811
categories:
  - Ruby
tags:
  - gzip
  - pagespeed
  - performance
  - ruby
  - sinatra
---
You guys must have heard about PageSpeed test from Google. It&#8217;s a really cool plugin for Chrome to let you know how you can optimize your webpage faster. I have been using it for a while but I couldn&#8217;t get my head around gzip compression which it seems that Google has taken that seriously. If you want the science bit. Here&#8217;s the [article][1] from Google.

And here&#8217;s the quickstart bit. The most simplest way is to put the compression in **config.ru**

``` ruby
require './server'
use Rack::Deflater
run Sinatra::Application
```

And that&#8217;s it I hope this will save you sometime.

 [1]: https://developers.google.com/speed/articles/gzip "gzip"
