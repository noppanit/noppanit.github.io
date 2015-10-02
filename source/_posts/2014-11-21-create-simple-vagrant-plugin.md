---
title: How to create a simple vagrant plugin.
author: Noppanit Charassinvichai
layout: post
permalink: /create-simple-vagrant-plugin/
dsq_thread_id:
  - 3249131795
categories:
  - Knowledges
tags:
  - gem
  - plugin
  - vagrant
---
I have been searching all over the Internet to find how to create a vagrant plugin. [Vagrant homepage][1] has information on how to create a vagrant plugin, but I would like to give a real world example. The plugin I&#8217;m going to create is **[vagrant-ls][2]** which is inspired by **[vagrant-list][3]**.

## How do you start

Vagrant that you installed already won&#8217;t work with local developing plugin. So, I recommend you to create a new gemset for your plugin. If you haven&#8217;t used [RVM][4], I highly recommend you use it now. It&#8217;s awesome!.

Once you have RVM installed you can create a gemset using this command **rvm gemset create vagrant-ls**. Then **rvm gemset use vagrant-ls** (Just in case). I recommend you do this for each of your ruby project. It helps you separate your gems, and it won&#8217;t mess up with different versions of your gems. First thing that you have to install is Bundler **gem install bundler**. It&#8217;s because we will use Bundler to manage all of our dependencies. Then you can create **Gemfile**.

``` ruby
source "https://rubygems.org"

group :development do
  gem "vagrant", git: "https://github.com/mitchellh/vagrant.git"
end

group :plugins do
  gem "vagrant-ls", path: "."
end
```

This is the most basic you would need for your plugin development. If you wonder what is *group :plugins*
. [Vagrant plugin][5] has already explained that. This will load your local plugin automatically without doing *bundle exec vagrant install plugin vagrant-ls* which will not quite work anyway. 

Then you can create your gemspec file. I name it **vagrant-ls.gemspec**

``` ruby
require File.expand_path('../lib/vagrant-ls/version', __FILE__)

Gem::Specification.new do |s|
  s.name            = 'vagrant-ls'
  s.version         = Vagrant::Ls::VERSION
  s.date            = '2014-11-18'
  s.summary         = "List all vms"
  s.description     = "A simple vagrant plugin for listing all vms"
  s.authors         = ["Noppanit Charassinvichai"]
  s.email           = 'noppanit.c@gmail.com'
  s.files           = `git ls-files`.split($\)
  s.executables     = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.require_paths   = ['lib']
  s.homepage        = 'https://github.com/noppanit/vagrant-ls'
  s.license         = 'GNU'
end
```

Then you crate **Rakefile**

``` ruby
require 'rubygems'
require 'bundler/setup'
Bundler::GemHelper.install_tasks
```

Then you move on to create your plugin using this [pattern][6].

``` ruby
# lib/vagrant-ls.rb
require 'bundler'

begin
  require 'vagrant'
rescue LoadError
  Bundler.require(:default, :development)
end

require 'vagrant-ls/plugin'
require 'vagrant-ls/command'
```

I almost forget you need to create VERSION file for gemspec to get your version number

``` ruby
# lib/vagrant-ls/version.rb
module Vagrant
    module Ls
        VERSION = '0.0.1'
    end
end
```
Then you create your plugin class, this will be the place where vagrant finds information about your plugin.

``` ruby
# lib/vagrant-ls/plugin.rb
module Vagrant

    module Ls

        class Plugin < Vagrant.plugin('2')
          name "List"

          description <<-DESC
          This plugin 'ls' all of the vms running inside the machine
          DESC

          command 'ls' do
            require_relative 'command'
            Command
          end

        end
    end
end
```

This is where you will name your command.

``` ruby
command 'ls' do
...
end
```

Last one, this is where vagrant will know how to execute your plugin

``` ruby
# lib/vagrant-ls/command.rb
module Vagrant
    module Ls
        class Command < Vagrant.plugin('2', :command)
            def execute
                exec('VBoxManage list vms')
                0
            end
        end
    end

end
```

I just run **VBoxManage** command to list all of the vms. Once you are done, you are ready to test your plugin. 

You can run this command

``` bash
bundle exec vagrant ls
```

. If everything is correct, it should list all of your vms with the name of your vms, so you know where you are you running all those vms. 

## Publish your gem

Now, it&#8217;s time to spread the love of your gem. You need to build your gem first. Remember the Rakefile? You can just run *rake build*

It will pack your gem to **.pkg** folder. Then you can just run

``` bash
gem push pkg/vagrant-ls-0.0.1.gem
```

. That&#8217;s it you have your gem published. If you look for [documentation][7] for publishing your gem. 

You can find my repository [here][8]. The reason I create this post is that, the plugin might evolve but this blog stays and it will be a good starting point for other people.

 [1]: https://docs.vagrantup.com/v2/plugins/index.html "vagrant plugin"
 [2]: https://github.com/noppanit/vagrant-ls "vagrant-ls"
 [3]: https://github.com/joshmcarthur/vagrant-list "vagrant-list"
 [4]: http://rvm.io/ "rvm"
 [5]: https://docs.vagrantup.com/v2/plugins/development-basics.html
 [6]: http://guides.rubygems.org/patterns/ "gem pattern"
 [7]: http://guides.rubygems.org/publishing/
 [8]: https://github.com/noppanit/vagrant-ls
