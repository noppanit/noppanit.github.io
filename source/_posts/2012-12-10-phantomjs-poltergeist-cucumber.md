---
title: PhantomJs + Poltergeist + Cucumber.
author: Noppanit Charassinvichai
layout: post
permalink: /phantomjs-poltergeist-cucumber/
dsq_thread_id:
  - 967994574
categories:
  - Ruby
tags:
  - cucumber
  - phantomjs
  - poltergeist
---
I love tests and I love experimenting with lots of things. So, I have just come across with PhantomJs a couple weeks ago and I absolutely love it. This should be included in every pipeline. No matter what you want to do, Jasmine? Acceptance Testing? I think right now PhantomJs is the most suitable one (May be there&#8217;ll be another one coming). But this post is not really about PhantomJs. I just want to show what it can do by using Poltergeist to run cucumber test headlessly. Of course you can do it with selenium-driver but running the test headlessly seem to be faster. So, I&#8217;ll just gonna jump right in.

First thing first, install PhantomJs from [here][1]

Then this is what my Gemfile looks like.

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          source <span class="re3">:rubygems</span><br /> <br /> gem <span class="st0">'poltergeist'</span><br /> gem <span class="st0">'cucumber'</span><br /> gem <span class="st0">'selenium-webdriver'</span><br /> gem <span class="st0">'capybara'</span><br /> gem <span class="st0">'rspec'</span>
        </div>
      </td>
    </tr>
  </table>
</div>

And this is my env.rb

<pre><div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="kw3">require</span> <span class="st0">'rubygems'</span><br />
          <span class="kw3">require</span> <span class="st0">'capybara'</span><br />
          <span class="kw3">require</span> <span class="st0">'capybara/cucumber'</span><br />
          <span class="kw3">require</span> <span class="st0">'capybara/dsl'</span><br />
          <span class="kw3">require</span> <span class="st0">'rspec'</span><br />
          <span class="kw3">require</span> <span class="st0">'capybara/poltergeist'</span><br />
          <br />
          <span class="co1"># Capybara.default_driver = :selenium #uncomment this to use selenium</span><br />
          Capybara.<span class="me1">javascript_driver</span> = <span class="re3">:poltergeist</span> <span class="co1">#uncomment this to use poltergeist</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

If you&#8217;re not familiar with Cucumber please have a look at [this][2]

And then you can run the test as you use to run your cucumber tests like this

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          cucumber features<span class="sy0">/</span>your_spec.<span class="me1">feature</span>
        </div>
      </td>
    </tr>
  </table>
</div>

If you run with Poltergeist driver then you should not see firefox popping up. 

I&#8217;ve written some example project [here.][3]

 [1]: http://phantomjs.org/download.html "PhantomJs download."
 [2]: https://github.com/cucumber/cucumber "cucumber"
 [3]: https://github.com/noppanit/phantomjs-examples