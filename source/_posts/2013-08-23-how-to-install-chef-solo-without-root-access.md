---
title: How to install Chef-Solo without root access?
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-install-chef-solo-without-root-access/
dsq_thread_id:
  - 1630606804
categories:
  - Knowledges
tags:
  - chef
  - chef-solo
  - devops
  - ruby
---
I know the title it&#8217;s stupid. And if you arrived at this post, I know your this question will pop up in your head, &#8220;Why on earth you want to do that?&#8221;. Chef is built in the assumption that it has root access and yeah it makes perfect sense. Without root access it&#8217;s like I want to hire a cleaner to clean my house but I want to get my house cleaned without giving my house key to the cleaner. It&#8217;s the same thing here. 

However, I&#8217;m here to just talk about how to do this in a very ugly and hacky way.

Problem:  
One day on a client side, they said we want you to deploy the application to our production VM server, but we cannot give you sudo or root access. Of course, it makes sense why would you give some guy root access. The IT guy gives me one folder which you can do anything as long as you stay inside that folder. We won&#8217;t have any problem because our app is basically just a java application with Jetty container, so it doesn&#8217;t matter where it lives. Now, here comes the problem we want to deploy our application anytime we want and we want to do the [PhoenixServer][1] pattern. But in this case, it&#8217;s just going to be semi phoenixServer, because we&#8217;re not going to wipe the whole box out. So we thought, yeah we could use Chef to provision the server. Great!. But how can you even install Chef without sudo or root access? If you go to Chef and download the Linux version it will be an RPM which obviously it needs root access to install that, which we don&#8217;t have. Hmm, what are we gonna do?

Solution:  
So we thought, well we just need Chef-solo because it&#8217;s just going to be one server. Chef is written in Ruby and our Centos VM doesn&#8217;t even come Ruby. The problem gets bigger, how can we install Ruby without root access. Ha! now here&#8217;s the tricky part. Chef is Ruby, Ruby is C. We have C, so we could compile Ruby and use gem to install Chef. Woohoo! Sounds easy right? By the way, Chef comes with embedded-ruby already that&#8217;s why when you install Chef you don&#8217;t need to install Ruby first. The Chef guys cleverly embedded Ruby inside Chef with all the gems and deploy that to **/opt/chef**. You can find more information [here][2]. So, we could do the same thing but we need to compile Ruby and dependencies to our folder. Ok, I&#8217;ll cut to the chest now. All we need is Ruby and Chef gem. In order to install, ruby which I found out you just need three minimum libraries, zlib, yaml and openssl. Here&#8217;s how to do it.

``` bash
#Install Openssl
wget https://www.openssl.org/source/openssl-1.0.0k.tar.gz
tar zxvf openssl-1.0.0k.tar.gz
cd openssl-1.0.0k
./config shared -fPIC --prefix=/home/centos/ruby --openssldir=/home/centos/ruby/ssl
make && make install
cd /home/centos

#Install zlib
wget http://zlib.net/zlib-1.2.8.tar.gz
tar xzvf zlib-1.2.8.tar.gz
cd zlib-1.2.8
./configure --prefix=/home/centos/ruby
make && make install
cd /home/centos

#Install Yaml
wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
tar xzvf yaml-0.1.4.tar.gz
cd yaml-0.1.4
./configure --disable-install-doc --prefix=/home/centos/ruby
make && make install
cd /home/centos

#Install Ruby 1.9.3
wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.gz
tar xzvf ruby-1.9.3-p448.tar.gz
cd ruby-1.9.3-p448
./configure --prefix=/home/centos/ruby --enable-shared --disable-install-doc --with-opt-dir=/home/centos/ruby
make && make install
cd /home/centos

#Install Chef gem
./ruby/bin/gem install --no-rdoc --no-ri chef
```

Please note that I installed ruby with chef to **/home/centos/ruby**, you need to change the path to where you want it to be, the same as chef guys decided **/opt/chef** is the best place for Chef to live. However, we don&#8217;t even have access to /opt.

Once you run this piece of code in your VM you will have ruby folder which you can just zip it and deploy to your server. There you go, you just got your customised Chef-solo.

I know it sounds stupid and it&#8217;s really hacky and ugly. But here&#8217;s what we found out so I want to blog it here so any lucky people might find this useful in the future.

 [1]: http://martinfowler.com/bliki/PhoenixServer.html "PhoenixServer"
 [2]: http://www.opscode.com/chef/install/ "Chef install"
