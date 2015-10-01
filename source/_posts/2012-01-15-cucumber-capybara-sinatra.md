---
title: Cucumber + Capybara + Sinatra
author: Noppanit Charassinvichai
layout: post
permalink: /cucumber-capybara-sinatra/
dsq_thread_id:
  - 539543436
categories:
  - Knowledges
---
This post is not to provide a tutorial of how to combine those three awesome applications together, but it might stop you from scratching your head when the test cannot be run correctly.

  1. You need to have Sinatra in subclass style rather than classic style. [Sinatra subclass-style][1]
  2. This is quite importance, you might find some website that is using Spec. but you need to change it to be &#8220;RSpec&#8221; in order for it to work.

<pre><div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="kw3">require</span> <span class="kw4">File</span>.<span class="me1">join</span><span class="br0">&#40;</span><span class="kw4">File</span>.<span class="me1">dirname</span><span class="br0">&#40;</span><span class="kw2">__FILE__</span><span class="br0">&#41;</span>, <span class="st0">'..'</span>, <span class="st0">'..'</span>, <span class="st0">'/server.rb'</span><span class="br0">&#41;</span><br />
          <br />
          <span class="kw3">require</span> <span class="st0">'rspec'</span><br />
          <span class="kw3">require</span> <span class="st0">'rspec/expectations'</span><br />
          <span class="kw3">require</span> <span class="st0">'rack/test'</span><br />
          <span class="kw3">require</span> <span class="st0">'capybara'</span><br />
          <span class="kw3">require</span> <span class="st0">'capybara/cucumber'</span><br />
          <span class="kw3">require</span> <span class="st0">'capybara/envjs'</span><br />
          <br />
          App.<span class="me1">set</span><span class="br0">&#40;</span><span class="re3">:environment</span>, <span class="re3">:test</span><span class="br0">&#41;</span><br />
          <br />
          World <span class="kw1">do</span><br />
          &nbsp; Capybara.<span class="me1">app</span> = App<br />
          &nbsp; Capybara.<span class="me1">javascript_driver</span> = <span class="re3">:envjs</span><br />
          &nbsp; <span class="kw1">include</span> Capybara<br />
          &nbsp; <span class="kw1">include</span> <span class="re2">RSpec::Expectations</span><br />
          &nbsp; <span class="kw1">include</span> <span class="re2">RSpec::Matchers</span><br />
          <span class="kw1">end</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

 [1]: http://www.sinatrarb.com/intro.html#Using%20a%20Classic%20Style%20Application%20with%20a%20config.ru "Sinatra subclass"