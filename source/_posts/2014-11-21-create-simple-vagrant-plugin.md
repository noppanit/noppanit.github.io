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

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          source <span class="st0">"https://rubygems.org"</span><br /> <br /> group <span class="re3">:development</span> <span class="kw1">do</span><br /> &nbsp; gem <span class="st0">"vagrant"</span>, git: <span class="st0">"https://github.com/mitchellh/vagrant.git"</span><br /> <span class="kw1">end</span><br /> <br /> group <span class="re3">:plugins</span> <span class="kw1">do</span><br /> &nbsp; gem <span class="st0">"vagrant-ls"</span>, path: <span class="st0">"."</span><br /> <span class="kw1">end</span>
        </div>
      </td>
    </tr>
  </table>
</div>

This is the most basic you would need for your plugin development. If you wonder what is

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
          group :plugins
        </div>
      </td>
    </tr>
  </table>
</div>

. [Vagrant plugin][5] has already explained that. This will load your local plugin automatically without doing

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
          bundle exec vagrant install plugin vagrant-ls
        </div>
      </td>
    </tr>
  </table>
</div>

which will not quite work anyway. 

Then you can create your gemspec file. I name it **vagrant-ls.gemspec**

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="kw3">require</span> <span class="kw4">File</span>.<span class="me1">expand_path</span><span class="br0">&#40;</span><span class="st0">'../lib/vagrant-ls/version'</span>, <span class="kw2">__FILE__</span><span class="br0">&#41;</span><br /> <br /> <span class="re2">Gem::Specification</span>.<span class="me1">new</span> <span class="kw1">do</span> <span class="sy0">|</span>s<span class="sy0">|</span><br /> &nbsp; s.<span class="me1">name</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;= <span class="st0">'vagrant-ls'</span><br /> &nbsp; s.<span class="me1">version</span> &nbsp; &nbsp; &nbsp; &nbsp; = <span class="re2">Vagrant::Ls::VERSION</span><br /> &nbsp; s.<span class="me1">date</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;= <span class="st0">'2014-11-18'</span><br /> &nbsp; s.<span class="me1">summary</span> &nbsp; &nbsp; &nbsp; &nbsp; = <span class="st0">"List all vms"</span><br /> &nbsp; s.<span class="me1">description</span> &nbsp; &nbsp; = <span class="st0">"A simple vagrant plugin for listing all vms"</span><br /> &nbsp; s.<span class="me1">authors</span> &nbsp; &nbsp; &nbsp; &nbsp; = <span class="br0">&#91;</span><span class="st0">"Noppanit Charassinvichai"</span><span class="br0">&#93;</span><br /> &nbsp; s.<span class="me1">email</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; = <span class="st0">'noppanit.c@gmail.com'</span><br /> &nbsp; s.<span class="me1">files</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; = <span class="st0">`git ls-files`</span>.<span class="kw3">split</span><span class="br0">&#40;</span>$\<span class="br0">&#41;</span><br /> &nbsp; s.<span class="me1">executables</span> &nbsp; &nbsp; = s.<span class="me1">files</span>.<span class="me1">grep</span><span class="br0">&#40;</span><span class="sy0">%</span>r<span class="br0">&#123;</span>^bin<span class="sy0">/</span><span class="br0">&#125;</span><span class="br0">&#41;</span>.<span class="me1">map</span><span class="br0">&#123;</span> <span class="sy0">|</span>f<span class="sy0">|</span> <span class="kw4">File</span>.<span class="me1">basename</span><span class="br0">&#40;</span>f<span class="br0">&#41;</span> <span class="br0">&#125;</span><br /> &nbsp; s.<span class="me1">require_paths</span> &nbsp; = <span class="br0">&#91;</span><span class="st0">'lib'</span><span class="br0">&#93;</span><br /> &nbsp; s.<span class="me1">homepage</span> &nbsp; &nbsp; &nbsp; &nbsp;= <span class="st0">'https://github.com/noppanit/vagrant-ls'</span><br /> &nbsp; s.<span class="me1">license</span> &nbsp; &nbsp; &nbsp; &nbsp; = <span class="st0">'GNU'</span><br /> <span class="kw1">end</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Then you crate **Rakefile**

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="kw3">require</span> <span class="st0">'rubygems'</span><br /> <span class="kw3">require</span> <span class="st0">'bundler/setup'</span><br /> <span class="re2">Bundler::GemHelper</span>.<span class="me1">install_tasks</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Then you move on to create your plugin using this [pattern][6].

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="co1"># lib/vagrant-ls.rb</span><br /> <span class="kw3">require</span> <span class="st0">'bundler'</span><br /> <br /> <span class="kw1">begin</span><br /> &nbsp; <span class="kw3">require</span> <span class="st0">'vagrant'</span><br /> <span class="kw1">rescue</span> <span class="kw4">LoadError</span><br /> &nbsp; Bundler.<span class="kw3">require</span><span class="br0">&#40;</span><span class="re3">:default</span>, <span class="re3">:development</span><span class="br0">&#41;</span><br /> <span class="kw1">end</span><br /> <br /> <span class="kw3">require</span> <span class="st0">'vagrant-ls/plugin'</span><br /> <span class="kw3">require</span> <span class="st0">'vagrant-ls/command'</span>
        </div>
      </td>
    </tr>
  </table>
</div>

I almost forget you need to create VERSION file for gemspec to get your version number

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="co1"># lib/vagrant-ls/version.rb</span><br /> <span class="kw1">module</span> Vagrant<br /> &nbsp; &nbsp; <span class="kw1">module</span> Ls<br /> &nbsp; &nbsp; &nbsp; &nbsp; VERSION = <span class="st0">'0.0.1'</span><br /> &nbsp; &nbsp; <span class="kw1">end</span><br /> <span class="kw1">end</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Then you create your plugin class, this will be the place where vagrant finds information about your plugin.

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="co1"># lib/vagrant-ls/plugin.rb</span><br /> <span class="kw1">module</span> Vagrant<br /> <br /> &nbsp; &nbsp; <span class="kw1">module</span> Ls<br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">class</span> Plugin <span class="sy0"><</span> Vagrant.<span class="me1">plugin</span><span class="br0">&#40;</span><span class="st0">'2'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name <span class="st0">"List"</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; description <span class="sy0"><<-</span>DESC<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; This plugin <span class="st0">'ls'</span> all of the vms running inside the machine<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DESC<br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; command <span class="st0">'ls'</span> <span class="kw1">do</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; require_relative <span class="st0">'command'</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Command<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">end</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">end</span><br /> &nbsp; &nbsp; <span class="kw1">end</span><br /> <span class="kw1">end</span>
        </div>
      </td>
    </tr>
  </table>
</div>

This is where you will name your command.

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          command <span class="st0">'ls'</span> <span class="kw1">do</span><br /> ...<br /> <span class="kw1">end</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Last one, this is where vagrant will know how to execute your plugin

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="co1"># lib/vagrant-ls/command.rb</span><br /> <span class="kw1">module</span> Vagrant<br /> &nbsp; &nbsp; <span class="kw1">module</span> Ls<br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">class</span> Command <span class="sy0"><</span> Vagrant.<span class="me1">plugin</span><span class="br0">&#40;</span><span class="st0">'2'</span>, <span class="re3">:command</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">def</span> execute<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw3">exec</span><span class="br0">&#40;</span><span class="st0">'VBoxManage list vms'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="nu0"></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">end</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">end</span><br /> &nbsp; &nbsp; <span class="kw1">end</span><br /> <br /> <span class="kw1">end</span>
        </div>
      </td>
    </tr>
  </table>
</div>

I just run **VBoxManage** command to list all of the vms. Once you are done, you are ready to test your plugin. 

You can run this command

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
          bundle exec vagrant ls
        </div>
      </td>
    </tr>
  </table>
</div>

. If everything is correct, it should list all of your vms with the name of your vms, so you know where you are you running all those vms. 

## Publish your gem

Now, it&#8217;s time to spread the love of your gem. You need to build your gem first. Remember the Rakefile? You can just run

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
          rake build
        </div>
      </td>
    </tr>
  </table>
</div>

It will pack your gem to **.pkg** folder. Then you can just run

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
          gem push pkg/vagrant-ls-0.0.1.gem
        </div>
      </td>
    </tr>
  </table>
</div>

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