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

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />33<br />34<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="co0">#Install Openssl</span><br /> <span class="kw2">wget</span> https:<span class="sy0">//</span>www.openssl.org<span class="sy0">/</span>source<span class="sy0">/</span>openssl-1.0.0k.tar.gz<br /> <span class="kw2">tar</span> zxvf openssl-1.0.0k.tar.gz<br /> <span class="kw3">cd</span> openssl-1.0.0k<br /> .<span class="sy0">/</span>config shared <span class="re5">-fPIC</span> <span class="re5">--prefix</span>=<span class="sy0">/</span>home<span class="sy0">/</span>centos<span class="sy0">/</span>ruby <span class="re5">--openssldir</span>=<span class="sy0">/</span>home<span class="sy0">/</span>centos<span class="sy0">/</span>ruby<span class="sy0">/</span>ssl<br /> <span class="kw2">make</span> <span class="sy0">&&</span> <span class="kw2">make</span> <span class="kw2">install</span><br /> <span class="kw3">cd</span> <span class="sy0">/</span>home<span class="sy0">/</span>centos<br /> <br /> <span class="co0">#Install zlib</span><br /> <span class="kw2">wget</span> http:<span class="sy0">//</span>zlib.net<span class="sy0">/</span>zlib-1.2.8.tar.gz<br /> <span class="kw2">tar</span> xzvf zlib-1.2.8.tar.gz<br /> <span class="kw3">cd</span> zlib-1.2.8<br /> .<span class="sy0">/</span>configure <span class="re5">--prefix</span>=<span class="sy0">/</span>home<span class="sy0">/</span>centos<span class="sy0">/</span>ruby<br /> <span class="kw2">make</span> <span class="sy0">&&</span> <span class="kw2">make</span> <span class="kw2">install</span><br /> <span class="kw3">cd</span> <span class="sy0">/</span>home<span class="sy0">/</span>centos<br /> <br /> <span class="co0">#Install Yaml</span><br /> <span class="kw2">wget</span> http:<span class="sy0">//</span>pyyaml.org<span class="sy0">/</span>download<span class="sy0">/</span>libyaml<span class="sy0">/</span>yaml-0.1.4.tar.gz<br /> <span class="kw2">tar</span> xzvf yaml-0.1.4.tar.gz<br /> <span class="kw3">cd</span> yaml-0.1.4<br /> .<span class="sy0">/</span>configure <span class="re5">--disable-install-doc</span> <span class="re5">--prefix</span>=<span class="sy0">/</span>home<span class="sy0">/</span>centos<span class="sy0">/</span>ruby<br /> <span class="kw2">make</span> <span class="sy0">&&</span> <span class="kw2">make</span> <span class="kw2">install</span><br /> <span class="kw3">cd</span> <span class="sy0">/</span>home<span class="sy0">/</span>centos<br /> <br /> <span class="co0">#Install Ruby 1.9.3</span><br /> <span class="kw2">wget</span> ftp:<span class="sy0">//</span>ftp.ruby-lang.org<span class="sy0">/</span>pub<span class="sy0">/</span>ruby<span class="sy0">/</span><span class="nu0">1.9</span><span class="sy0">/</span>ruby-1.9.3-p448.tar.gz<br /> <span class="kw2">tar</span> xzvf ruby-1.9.3-p448.tar.gz<br /> <span class="kw3">cd</span> ruby-1.9.3-p448<br /> .<span class="sy0">/</span>configure <span class="re5">--prefix</span>=<span class="sy0">/</span>home<span class="sy0">/</span>centos<span class="sy0">/</span>ruby <span class="re5">--enable-shared</span> <span class="re5">--disable-install-doc</span> <span class="re5">--with-opt-dir</span>=<span class="sy0">/</span>home<span class="sy0">/</span>centos<span class="sy0">/</span>ruby<br /> <span class="kw2">make</span> <span class="sy0">&&</span> <span class="kw2">make</span> <span class="kw2">install</span><br /> <span class="kw3">cd</span> <span class="sy0">/</span>home<span class="sy0">/</span>centos<br /> <br /> <span class="co0">#Install Chef gem</span><br /> .<span class="sy0">/</span>ruby<span class="sy0">/</span>bin<span class="sy0">/</span>gem <span class="kw2">install</span> <span class="re5">--no-rdoc</span> <span class="re5">--no-ri</span> chef
        </div>
      </td>
    </tr>
  </table>
</div>

Please note that I installed ruby with chef to **/home/centos/ruby**, you need to change the path to where you want it to be, the same as chef guys decided **/opt/chef** is the best place for Chef to live. However, we don&#8217;t even have access to /opt.

Once you run this piece of code in your VM you will have ruby folder which you can just zip it and deploy to your server. There you go, you just got your customised Chef-solo.

I know it sounds stupid and it&#8217;s really hacky and ugly. But here&#8217;s what we found out so I want to blog it here so any lucky people might find this useful in the future.

 [1]: http://martinfowler.com/bliki/PhoenixServer.html "PhoenixServer"
 [2]: http://www.opscode.com/chef/install/ "Chef install"