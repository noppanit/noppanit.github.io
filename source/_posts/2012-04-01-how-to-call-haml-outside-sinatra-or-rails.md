---
title: How to call haml outside sinatra or Rails?
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-call-haml-outside-sinatra-or-rails/
dsq_thread_id:
  - 632879359
categories:
  - Ruby
---
People would think why would you want to do that. Well, in my case I just want to use haml to generate html for me in Test so that I could inject that in to Pusher to test the functionality of the feed page. I could use static html string, but if I change haml I don&#8217;t want to come back to the test and change the string again. 

So, Haml actually is just a static class that you can call anywhere, but where you call inside Sinatra or Rails controller. You could just use 

```
haml :my_view
```

However, if you do this outside Sinatra, you would get an exception that haml is not found or something close. 

So here&#8217;s just a simple solution plus I&#8217;ve added how to call helper in that as well. 

``` ruby
 base = Class.new do
    include Sinatra::DateTimeHelper # This is the helper that you want to include in Haml.
  end.new
  
  _feed_partial_path = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "views", "_feed_partial.haml"))
  
  engine = Haml::Engine.new(IO.read(_feed_partial_path))
  rendered = engine.render(base, :var_to_inject => var_to_inject) # or if you don't want to use helper it could be just engine.render(Object.new, :var_to_inject => var_to_inject)
  puts rendered
```

That&#8217;s it nice and easy!
