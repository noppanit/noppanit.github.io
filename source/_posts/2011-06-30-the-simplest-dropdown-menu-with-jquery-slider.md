---
title: The simplest dropdown menu with jQuery slider
author: Noppanit Charassinvichai
layout: post
permalink: /the-simplest-dropdown-menu-with-jquery-slider/
dsq_thread_id:
  - 346047742
categories:
  - Knowledges
---
Nothing much to say here. So, let&#8217;s see the code. 

[<img src="http://www.noppanit.com/wp-content/uploads/2011/06/Screen-shot-2011-06-30-at-00.59.01.png" alt="Dropdown menu slider" title="Dropdown menu" width="153" height="86" class="alignnone size-full wp-image-776" />][1]

<div class="codecolorer-container html4strict blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />33<br />34<br />35<br />36<br />37<br />38<br />39<br />40<br />41<br />42<br />43<br />44<br />45<br />46<br />47<br />48<br />49<br />50<br />51<br />52<br />53<br />54<br />55<br />56<br />57<br />58<br />59<br />60<br />
        </div>
      </td>
      
      <td>
        <div class="html4strict codecolorer">
          <span class="sc0"><!DOCTYPE html></span><br /> <span class="sc2"><<a href="http://december.com/html/4/element/html.html"><span class="kw2">html</span></a>></span><br /> <span class="sc2"><<a href="http://december.com/html/4/element/head.html"><span class="kw2">head</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/style.html"><span class="kw2">style</span></a>></span><br /> ul<br /> {<br /> &nbsp; list-style:none;<br /> }<br /> ul li{<br /> &nbsp; float: left;<br /> &nbsp; margin-right: 20px;<br /> &nbsp; position: relative;<br /> }<br /> #sublist{<br /> &nbsp; padding: 0;<br /> &nbsp; position: absolute;<br /> &nbsp; border-style: none solid solid solid;<br /> &nbsp; border-width: 1px 1px 1px 1px;<br /> }<br /> <br /> #sublist li{<br /> <br /> }<br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/style.html"><span class="kw2">style</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a> <span class="kw3">src</span><span class="sy0">=</span><span class="st0">"http://code.jquery.com/jquery-latest.js"</span>><<span class="sy0">/</span><a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a>></span><br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/head.html"><span class="kw2">head</span></a>></span><br /> <span class="sc2"><<a href="http://december.com/html/4/element/body.html"><span class="kw2">body</span></a>></span><br /> <span class="sc2"><<a href="http://december.com/html/4/element/ul.html"><span class="kw2">ul</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span>A<span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a> <span class="kw3">id</span><span class="sy0">=</span><span class="st0">"list"</span>></span><br /> &nbsp; &nbsp; B<br /> &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/ul.html"><span class="kw2">ul</span></a> <span class="kw3">id</span><span class="sy0">=</span><span class="st0">"sublist"</span>></span><br /> &nbsp; &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span>B1<span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span><br /> &nbsp; &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span>B2<span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span><br /> &nbsp; &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/ul.html"><span class="kw2">ul</span></a>></span><br /> &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span>C<span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span><br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/ul.html"><span class="kw2">ul</span></a>></span><br /> <br /> <span class="sc2"><<a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a>></span><br /> $(document).ready( function(){<br /> &nbsp; $('#sublist').hide();<br /> &nbsp; <br /> });<br /> <br /> $('#list').click(function() {<br /> &nbsp; if ( $("#sublist").is(":hidden") )<br /> &nbsp; {<br /> &nbsp; &nbsp; $('#sublist').slideDown("slow");<br /> &nbsp; }<br /> &nbsp; else<br /> &nbsp; {<br /> &nbsp; &nbsp; $('#sublist').hide();<br /> &nbsp; }<br /> });<br /> <br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a>></span><br /> <br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/body.html"><span class="kw2">body</span></a>></span><br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/html.html"><span class="kw2">html</span></a>></span>
        </div>
      </td>
    </tr>
  </table>
</div>

 [1]: http://www.noppanit.com/wp-content/uploads/2011/06/Screen-shot-2011-06-30-at-00.59.01.png