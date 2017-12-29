---
title: Cucumber + Capybara + Sinatra
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 539543436
categories:
  - Knowledges
---
This post is not to provide a tutorial of how to combine those three awesome applications together, but it might stop you from scratching your head when the test cannot be run correctly.

  1. You need to have Sinatra in subclass style rather than classic style. [Sinatra subclass-style][1]
  2. This is quite importance, you might find some website that is using Spec. but you need to change it to be &#8220;RSpec&#8221; in order for it to work.

``` ruby
require File.join(File.dirname(__FILE__), '..', '..', '/server.rb')

require 'rspec'
require 'rspec/expectations'
require 'rack/test'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/envjs'

App.set(:environment, :test)

World do
  Capybara.app = App
  Capybara.javascript_driver = :envjs
  include Capybara
  include RSpec::Expectations
  include RSpec::Matchers
end
```

 [1]: http://www.sinatrarb.com/intro.html#Using%20a%20Classic%20Style%20Application%20with%20a%20config.ru "Sinatra subclass"
