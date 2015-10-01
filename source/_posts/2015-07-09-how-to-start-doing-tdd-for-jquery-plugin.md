---
title: How to start doing TDD for jQuery plugin.
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-start-doing-tdd-for-jquery-plugin/
dsq_thread_id:
  - 3917701396
categories:
  - Knowledges
tags:
  - javascript
  - jquery
  - plugin
  - tdd
---
I&#8217;m a big fan of TDD. I get nervous every time when I put some code it without having tests. I&#8217;m developing a simple jQuery plugin and I think hey we can TDD this.

## What is it?

The plugin is really simple. It turns ul tag to be taggable field. It&#8217;s similar to [tag-it][1] but with a lot less functionalities and doesn&#8217;t depend on jquery-ui

## What you need

I decided to use Karma because I&#8217;m going to test a lot of behaviours and Karma seems like a good fit as it run on real browser. Here&#8217;s how I setup my project. 

I chose jasmine-jquery because it&#8217;s easier to create some element to test and it&#8217;s easy to setup.

This is my **gulpfile.js**

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">var</span> gulp <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'gulp'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="kw2">var</span> karma <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'gulp-karma'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> <span class="kw2">var</span> testFiles <span class="sy0">=</span> <span class="br0">&#91;</span><br /> &nbsp; <span class="st0">'tests/vendors/jquery-1.11.3.min.js'</span><span class="sy0">,</span><br /> &nbsp; <span class="st0">'tests/vendors/jasmine-jquery.js'</span><span class="sy0">,</span><br /> &nbsp; <span class="st0">'src/**/*.js'</span><span class="sy0">,</span><br /> &nbsp; <span class="st0">'tests/spec/**/*.js'</span><br /> <span class="br0">&#93;</span><span class="sy0">;</span><br /> <span class="coMULTI">/**<br /> &nbsp;* Run test once and exit<br /> &nbsp;*/</span><br /> gulp.<span class="me1">task</span><span class="br0">&#40;</span><span class="st0">'test'</span><span class="sy0">,</span> <span class="kw2">function</span> <span class="br0">&#40;</span>done<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; <span class="kw1">return</span> gulp.<span class="me1">src</span><span class="br0">&#40;</span>testFiles<span class="br0">&#41;</span><br /> &nbsp; &nbsp; .<span class="me1">pipe</span><span class="br0">&#40;</span>karma<span class="br0">&#40;</span><span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; configFile<span class="sy0">:</span> <span class="st0">'karma.conf.js'</span><span class="sy0">,</span><br /> &nbsp; &nbsp; &nbsp; action<span class="sy0">:</span> <span class="st0">'run'</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><br /> &nbsp; .<span class="me1">on</span><span class="br0">&#40;</span><span class="st0">'error'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span>err<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="co1">// Make sure failed tests cause gulp to exit non-zero </span><br /> &nbsp; &nbsp; <span class="kw1">throw</span> err<span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> gulp.<span class="me1">task</span><span class="br0">&#40;</span><span class="st0">'default'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; gulp.<span class="me1">src</span><span class="br0">&#40;</span>testFiles<span class="br0">&#41;</span><br /> &nbsp; &nbsp; .<span class="me1">pipe</span><span class="br0">&#40;</span>karma<span class="br0">&#40;</span><span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; configFile<span class="sy0">:</span> <span class="st0">'karma.conf.js'</span><span class="sy0">,</span><br /> &nbsp; &nbsp; &nbsp; action<span class="sy0">:</span> <span class="st0">'watch'</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

This is my **karma.conf.js**

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          module.<span class="me1">exports</span> <span class="sy0">=</span> <span class="kw2">function</span><span class="br0">&#40;</span>config<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; config.<span class="me1">set</span><span class="br0">&#40;</span><span class="br0">&#123;</span><br /> &nbsp; &nbsp; browsers<span class="sy0">:</span> <span class="br0">&#91;</span><span class="st0">'PhantomJS'</span><span class="br0">&#93;</span><span class="sy0">,</span><br /> &nbsp; &nbsp; frameworks<span class="sy0">:</span> <span class="br0">&#91;</span><span class="st0">'jasmine'</span><span class="br0">&#93;</span><br /> &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="br0">&#125;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Here&#8217;s my first test

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          describe<span class="br0">&#40;</span><span class="st0">'Taggify'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; <span class="kw2">var</span> fixture<span class="sy0">;</span><br /> &nbsp; beforeEach<span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; fixture <span class="sy0">=</span> setFixtures<span class="br0">&#40;</span><span class="st0">'<ul id="tag"></ul>'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; jQuery<span class="br0">&#40;</span><span class="st0">'#tag'</span><span class="br0">&#41;</span>.<span class="me1">taggify</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <br /> &nbsp; it<span class="br0">&#40;</span><span class="st0">'should initialize text box'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> input <span class="sy0">=</span> fixture.<span class="me1">find</span><span class="br0">&#40;</span><span class="st0">'input'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; expect<span class="br0">&#40;</span>input.<span class="me1">length</span> <span class="sy0">></span> <span class="nu0"></span><span class="br0">&#41;</span>.<span class="me1">toBeTruthy</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

You will see that the test failed now we implement some code.

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>$<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; $.<span class="me1">fn</span>.<span class="me1">taggify</span> <span class="sy0">=</span> <span class="kw2">function</span><span class="br0">&#40;</span>options<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; create<span class="br0">&#40;</span><span class="kw1">this</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="kw1">return</span> <span class="kw1">this</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><span class="sy0">;</span><br /> <br /> &nbsp; <span class="kw2">function</span> create<span class="br0">&#40;</span>$theElement<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> $input <span class="sy0">=</span> $<span class="br0">&#40;</span><span class="st0">'<input class="tag-input"></input>'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; .<span class="me1">attr</span><span class="br0">&#40;</span><span class="st0">'type'</span><span class="sy0">,</span> <span class="st0">'text'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; .<span class="me1">attr</span><span class="br0">&#40;</span><span class="st0">'autocomplete'</span><span class="sy0">,</span> <span class="st0">'off'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; .<span class="me1">wrap</span><span class="br0">&#40;</span><span class="st0">'<li></li>'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; $theElement.<span class="me1">append</span><span class="br0">&#40;</span>$input.<span class="me1">parent</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="br0">&#40;</span>jQuery<span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Now the test passed. 

Now let&#8217;s add some event so when you hit enter the tag is added. So, I added one more test

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          &nbsp; it<span class="br0">&#40;</span><span class="st0">'should add a tag'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> input <span class="sy0">=</span> fixture.<span class="me1">find</span><span class="br0">&#40;</span><span class="st0">'input'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; input.<span class="me1">val</span><span class="br0">&#40;</span><span class="st0">'tag'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; input.<span class="me1">trigger</span><span class="br0">&#40;</span>jQuery.<span class="me1">Event</span><span class="br0">&#40;</span><span class="st0">'keyup'</span><span class="sy0">,</span> <span class="br0">&#123;</span> keyCode<span class="sy0">:</span> <span class="nu0">13</span> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; <span class="kw2">var</span> tags <span class="sy0">=</span> fixture.<span class="me1">find</span><span class="br0">&#40;</span><span class="st0">'.tag-label'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> tag <span class="sy0">=</span> jQuery<span class="br0">&#40;</span>tags<span class="br0">&#91;</span><span class="nu0"></span><span class="br0">&#93;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <br /> &nbsp; &nbsp; expect<span class="br0">&#40;</span>tag.<span class="me1">html</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#41;</span>.<span class="me1">toBe</span><span class="br0">&#40;</span><span class="st0">'tag'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; expect<span class="br0">&#40;</span>tags.<span class="me1">length</span> <span class="sy0">></span> <span class="nu0"></span><span class="br0">&#41;</span>.<span class="me1">toBeTruthy</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Now the test failed.

I&#8217;ll fix the test by doing this.

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>$<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; $.<span class="me1">fn</span>.<span class="me1">taggify</span> <span class="sy0">=</span> <span class="kw2">function</span><span class="br0">&#40;</span>options<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; create<span class="br0">&#40;</span><span class="kw1">this</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="kw1">return</span> <span class="kw1">this</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><span class="sy0">;</span><br /> <br /> &nbsp; <span class="kw2">function</span> create<span class="br0">&#40;</span>$theElement<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> $input <span class="sy0">=</span> $<span class="br0">&#40;</span><span class="st0">'<input class="tag-input"></input>'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; .<span class="me1">attr</span><span class="br0">&#40;</span><span class="st0">'type'</span><span class="sy0">,</span> <span class="st0">'text'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; .<span class="me1">attr</span><span class="br0">&#40;</span><span class="st0">'autocomplete'</span><span class="sy0">,</span> <span class="st0">'off'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; .<span class="me1">wrap</span><span class="br0">&#40;</span><span class="st0">'<li></li>'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; $input.<span class="me1">on</span><span class="br0">&#40;</span><span class="st0">'keyup'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span>e<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; <span class="kw1">if</span> <span class="br0">&#40;</span>e.<span class="me1">keyCode</span> <span class="sy0">===</span> <span class="nu0">13</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw2">var</span> tagText <span class="sy0">=</span> $input.<span class="me1">val</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw2">var</span> $span <span class="sy0">=</span> $<span class="br0">&#40;</span><span class="st0">'<span class="tag-label"></span>'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; $span.<span class="me1">text</span><span class="br0">&#40;</span>tagText<span class="br0">&#41;</span>.<span class="me1">wrap</span><span class="br0">&#40;</span><span class="st0">'<li class="tag-choice"></li>'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; $theElement.<span class="me1">prepend</span><span class="br0">&#40;</span>$span.<span class="me1">parent</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; $input.<span class="me1">val</span><span class="br0">&#40;</span><span class="st0">''</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; $theElement.<span class="me1">append</span><span class="br0">&#40;</span>$input.<span class="me1">parent</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="br0">&#40;</span>jQuery<span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Now I want to add some negative test case.

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          &nbsp; it<span class="br0">&#40;</span><span class="st0">'should not add a tag'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> input <span class="sy0">=</span> fixture.<span class="me1">find</span><span class="br0">&#40;</span><span class="st0">'input'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; input.<span class="me1">trigger</span><span class="br0">&#40;</span>jQuery.<span class="me1">Event</span><span class="br0">&#40;</span><span class="st0">'keyup'</span><span class="sy0">,</span> <span class="br0">&#123;</span> keyCode<span class="sy0">:</span> <span class="nu0">13</span> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> tags <span class="sy0">=</span> fixture.<span class="me1">find</span><span class="br0">&#40;</span><span class="st0">'.tag-label'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <br /> &nbsp; &nbsp; expect<span class="br0">&#40;</span>tags.<span class="me1">length</span> <span class="sy0">></span> <span class="nu0"></span><span class="br0">&#41;</span>.<span class="me1">toBeFalsy</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Oops the test failed, looks like I missed something

I will fix the test by

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>$<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; $.<span class="me1">fn</span>.<span class="me1">taggify</span> <span class="sy0">=</span> <span class="kw2">function</span><span class="br0">&#40;</span>options<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; create<span class="br0">&#40;</span><span class="kw1">this</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="kw1">return</span> <span class="kw1">this</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><span class="sy0">;</span><br /> <br /> &nbsp; <span class="kw2">function</span> create<span class="br0">&#40;</span>$theElement<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> $input <span class="sy0">=</span> $<span class="br0">&#40;</span><span class="st0">'<input class="tag-input"></input>'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; .<span class="me1">attr</span><span class="br0">&#40;</span><span class="st0">'type'</span><span class="sy0">,</span> <span class="st0">'text'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; .<span class="me1">attr</span><span class="br0">&#40;</span><span class="st0">'autocomplete'</span><span class="sy0">,</span> <span class="st0">'off'</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; .<span class="me1">wrap</span><span class="br0">&#40;</span><span class="st0">'<li></li>'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; $input.<span class="me1">on</span><span class="br0">&#40;</span><span class="st0">'keyup'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span>e<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; <span class="kw1">if</span> <span class="br0">&#40;</span>e.<span class="me1">keyCode</span> <span class="sy0">===</span> <span class="nu0">13</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw2">var</span> tagText <span class="sy0">=</span> $input.<span class="me1">val</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span>tagText <span class="sy0">!==</span> <span class="st0">''</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw2">var</span> $span <span class="sy0">=</span> $<span class="br0">&#40;</span><span class="st0">'<span class="tag-label"></span>'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $span.<span class="me1">text</span><span class="br0">&#40;</span>tagText<span class="br0">&#41;</span>.<span class="me1">wrap</span><span class="br0">&#40;</span><span class="st0">'<li class="tag-choice"></li>'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $theElement.<span class="me1">prepend</span><span class="br0">&#40;</span>$span.<span class="me1">parent</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $input.<span class="me1">val</span><span class="br0">&#40;</span><span class="st0">''</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; $theElement.<span class="me1">append</span><span class="br0">&#40;</span>$input.<span class="me1">parent</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="br0">&#40;</span>jQuery<span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

That&#8217;s it. I hope you enjoy and love TDD more. And here&#8217;s the [github repo][2]

 [1]: http://aehlke.github.io/tag-it/
 [2]: https://github.com/noppanit/taggify