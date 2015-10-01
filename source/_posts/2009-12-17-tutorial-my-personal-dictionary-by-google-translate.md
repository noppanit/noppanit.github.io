---
title: 'Tutorial &#8211; My Personal Dictionary by Google Translate'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-my-personal-dictionary-by-google-translate/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/7bDMdf
wp_jd_target:
  - http://www.noppanit.com/tutorial-my-personal-dictionary-by-google-translate/
dsq_thread_id:
  - 187161009
categories:
  - Javascript
---
As Google provides us the AJAX support for Google translate and other very useful API to access the most powerful API from Google. I tried to play a little bit with the Google Translate to build my very simple dictionary Eng &#8211; Thai. 

Here is the code, which is very simple and straightforward.

<div class="codecolorer-container html4strict blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />33<br />34<br />35<br />36<br />
        </div>
      </td>
      
      <td>
        <div class="html4strict codecolorer">
          <span class="sc0"><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"></span><br /> <span class="sc2"><<a href="http://december.com/html/4/element/html.html"><span class="kw2">html</span></a> xmlns<span class="sy0">=</span><span class="st0">"http://www.w3.org/1999/xhtml"</span>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/head.html"><span class="kw2">head</span></a>></span><br /> &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/meta.html"><span class="kw2">meta</span></a> <span class="kw3">http-equiv</span><span class="sy0">=</span><span class="st0">"content-type"</span> <span class="kw3">content</span><span class="sy0">=</span><span class="st0">"text/html; charset=utf-8"</span><span class="sy0">/</span>></span><br /> &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/title.html"><span class="kw2">title</span></a>></span>Dictionary Eng - Thai<span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/title.html"><span class="kw2">title</span></a>></span><br /> &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a> <span class="kw3">type</span><span class="sy0">=</span><span class="st0">"text/javascript"</span> <span class="kw3">src</span><span class="sy0">=</span><span class="st0">"http://www.google.com/jsapi"</span>><<span class="sy0">/</span><a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a>></span><br /> &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a> <span class="kw3">type</span><span class="sy0">=</span><span class="st0">"text/javascript"</span>></span><br /> &nbsp; &nbsp; function callBackTranslate() <br /> &nbsp; {<br /> &nbsp; &nbsp; var word = document.getElementById("word").value;<br /> &nbsp; &nbsp; &nbsp; google.language.translate(word, "en", "th", function(result) {<br /> &nbsp; &nbsp; &nbsp; &nbsp; if (!result.error) {<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var container = document.getElementById("translation");<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; container.innerHTML = result.translation;<br /> &nbsp; &nbsp; &nbsp; &nbsp; }<br /> &nbsp; &nbsp; &nbsp; });<br /> &nbsp; &nbsp; }<br /> &nbsp; <br /> &nbsp; function translate()<br /> &nbsp; {<br /> &nbsp; &nbsp; google.load("language", "1", {"callback" : callBackTranslate});<br /> &nbsp; }<br /> <br /> &nbsp; &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a>></span><br /> &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/head.html"><span class="kw2">head</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/body.html"><span class="kw2">body</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/div.html"><span class="kw2">div</span></a>></span><br /> &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/input.html"><span class="kw2">input</span></a> <span class="kw3">type</span><span class="sy0">=</span><span class="st0">"text"</span> <span class="kw3">id</span><span class="sy0">=</span><span class="st0">"word"</span> <span class="kw3">name</span><span class="sy0">=</span><span class="st0">"word"</span><span class="sy0">/</span>></span><br /> &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/div.html"><span class="kw2">div</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/div.html"><span class="kw2">div</span></a>></span><br /> &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/input.html"><span class="kw2">input</span></a> <span class="kw3">type</span><span class="sy0">=</span><span class="st0">"button"</span> <span class="kw3">value</span><span class="sy0">=</span><span class="st0">"Translate"</span> <span class="kw3">onclick</span><span class="sy0">=</span><span class="st0">"translate();"</span><span class="sy0">/</span>></span><br /> &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/div.html"><span class="kw2">div</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/div.html"><span class="kw2">div</span></a> <span class="kw3">id</span><span class="sy0">=</span><span class="st0">"translation"</span>></span> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/div.html"><span class="kw2">div</span></a>></span><br /> <br /> &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/body.html"><span class="kw2">body</span></a>></span><br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/html.html"><span class="kw2">html</span></a>></span>
        </div>
      </td>
    </tr>
  </table>
</div>