---
title: 'How to : Google Translate API with Perl'
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-google-translate-api-with-perl/
dsq_thread_id:
  - 232497796
categories:
  - Knowledges
---
So, without boring introduction. 

But you need to install some library for Perl as well by using cpan.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          cpan install JSON<br /> cpan install REST::Client
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container perl blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />
        </div>
      </td>
      
      <td>
        <div class="perl codecolorer">
          <span class="co1">#!/usr/bin/perl</span><br /> <br /> <span class="kw2">use</span> REST<span class="sy0">::</span><span class="me2">Client</span><span class="sy0">;</span><br /> <span class="kw2">use</span> JSON<span class="sy0">;</span><br /> <span class="kw2">use</span> HTML<span class="sy0">::</span><span class="me2">Entities</span> <a href="http://perldoc.perl.org/functions/qw.html"><span class="kw3">qw</span></a><span class="br0">&#40;</span>decode_entities<span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> <span class="kw1">while</span> <span class="br0">&#40;</span><span class="nu0">1</span><span class="br0">&#41;</span> <br /> <span class="br0">&#123;</span><br /> &nbsp; <a href="http://perldoc.perl.org/functions/print.html"><span class="kw3">print</span></a> <span class="st0">"Please enter English word: "</span><span class="sy0">;</span><br /> &nbsp; <a href="http://perldoc.perl.org/functions/chop.html"><span class="kw3">chop</span></a> <span class="br0">&#40;</span> <span class="co5">$_</span> <span class="sy0">=</span> <span class="re4"><STDIN></span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">my</span> <span class="re0">$client</span> <span class="sy0">=</span> REST<span class="sy0">::</span><span class="me2">Client</span><span class="sy0">-></span><span class="kw2">new</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="re0">$client</span><span class="sy0">-></span><span class="me1">GET</span><span class="br0">&#40;</span><span class="st0">"https://www.googleapis.com/language/translate/v2?key=AIzaSyACJybEm6lyelnYHZzXfydtk-V6-Uz48bQ&en&target=fr&q=$_"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="re0">$response</span> <span class="sy0">=</span> <span class="re0">$client</span><span class="sy0">-></span><span class="me1">responseContent</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; <span class="re0">$json_text</span> <span class="sy0">=</span> from_json<span class="br0">&#40;</span> <span class="re0">$response</span> <span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; <span class="kw1">foreach</span> <span class="kw1">my</span> <span class="re0">$french</span><span class="br0">&#40;</span><span class="sy0">@</span><span class="br0">&#123;</span><span class="re0">$json_text</span><span class="sy0">-></span><span class="br0">&#123;</span>data<span class="br0">&#125;</span><span class="sy0">-></span><span class="br0">&#123;</span>translations<span class="br0">&#125;</span><span class="br0">&#125;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">my</span> <span class="re0">%ep_hash</span> <span class="sy0">=</span> <span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; <span class="re0">$ep_hash</span><span class="br0">&#123;</span>translatedText<span class="br0">&#125;</span> <span class="sy0">=</span> <span class="st0">"Translated to French: $french->{translatedText}"</span><span class="sy0">;</span><br /> &nbsp;<br /> &nbsp; &nbsp; &nbsp; <span class="co1"># print french</span><br /> &nbsp; &nbsp; &nbsp; <span class="kw1">while</span> <span class="br0">&#40;</span><span class="kw1">my</span><span class="br0">&#40;</span><span class="re0">$key</span><span class="sy0">,</span> <span class="re0">$value</span><span class="br0">&#41;</span> <span class="sy0">=</span> <a href="http://perldoc.perl.org/functions/each.html"><span class="kw3">each</span></a> <span class="br0">&#40;</span><span class="re0">%ep_hash</span><span class="br0">&#41;</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <a href="http://perldoc.perl.org/functions/print.html"><span class="kw3">print</span></a> decode_entities<span class="br0">&#40;</span><span class="re0">$value</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <a href="http://perldoc.perl.org/functions/print.html"><span class="kw3">print</span></a> <span class="st0">"<span class="es0">\n</span>"</span><span class="sy0">;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>