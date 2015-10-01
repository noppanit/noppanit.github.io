---
title: 'Tutorial : Convert a table to XML'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-convert-a-table-to-xml/
categories:
  - Javascript
---
Javascript file

<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />33<br />34<br />35<br />36<br />37<br />38<br />39<br />40<br />41<br />42<br />43<br />44<br />45<br />46<br />47<br />48<br />49<br />50<br />51<br />52<br />53<br />54<br />55<br />56<br />57<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">function</span> getXMLFromArrays<span class="br0">&#40;</span> h <span class="sy0">,</span> v <span class="br0">&#41;</span><br />
          <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw2">var</span> xmlStr <span class="sy0">=</span> <span class="st0">'&lt;Data&gt;'</span><span class="sy0">;</span><br />
          &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span> <span class="kw2">var</span> k <span class="sy0">=</span> <span class="nu0"></span> <span class="sy0">;</span> k <span class="sy0">&lt;</span> v.<span class="me1">length</span> <span class="sy0">;</span> k<span class="sy0">++</span> <span class="br0">&#41;</span><br />
          &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; xmlStr <span class="sy0">+=</span> <span class="st0">'&lt;Row&gt;'</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span> <span class="kw2">var</span> l <span class="sy0">=</span> <span class="nu0"></span> <span class="sy0">;</span> l <span class="sy0">&lt;</span> h.<span class="me1">length</span> <span class="sy0">;</span> l<span class="sy0">++</span> <span class="br0">&#41;</span><br />
          &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; xmlStr <span class="sy0">+=</span> <span class="st0">'&lt;'</span> <span class="sy0">+</span> h<span class="br0">&#91;</span> l <span class="br0">&#93;</span>.<span class="me1">innerHTML</span> <span class="sy0">+</span> <span class="st0">'&gt;'</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; xmlStr <span class="sy0">+=</span> v<span class="br0">&#91;</span> k <span class="br0">&#93;</span><span class="br0">&#91;</span> l <span class="br0">&#93;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; xmlStr <span class="sy0">+=</span> <span class="st0">'&lt;/'</span> <span class="sy0">+</span> h<span class="br0">&#91;</span> l <span class="br0">&#93;</span>.<span class="me1">innerHTML</span> <span class="sy0">+</span> <span class="st0">'&gt;'</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; xmlStr <span class="sy0">+=</span> <span class="st0">'&lt;/Row&gt;'</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; xmlStr <span class="sy0">+=</span> <span class="st0">'&lt;/Data&gt;'</span><span class="sy0">;</span><br />
          &nbsp; <span class="kw1">return</span> xmlStr<span class="sy0">;</span><br />
          <span class="br0">&#125;</span><br />
          <br />
          <span class="kw2">function</span> getHeaders<span class="br0">&#40;</span> trs <span class="br0">&#41;</span><br />
          <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw2">var</span> headers <span class="sy0">=</span> trs<span class="br0">&#91;</span><span class="nu0"></span><span class="br0">&#93;</span><span class="sy0">;</span><br />
          &nbsp; <span class="kw2">var</span> tds <span class="sy0">=</span> headers.<span class="me1">getElementsByTagName</span><span class="br0">&#40;</span> <span class="st0">'td'</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="kw1">return</span> tds<span class="sy0">;</span><br />
          <span class="br0">&#125;</span><br />
          <br />
          <span class="kw2">function</span> initialArray<span class="br0">&#40;</span> arr <span class="br0">&#41;</span><br />
          <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span> <span class="kw2">var</span> i <span class="sy0">=</span> <span class="nu0"></span> <span class="sy0">;</span> i <span class="sy0">&lt;</span> arr.<span class="me1">length</span> <span class="sy0">;</span> i<span class="sy0">++</span> <span class="br0">&#41;</span><br />
          &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; arr<span class="br0">&#91;</span> i <span class="br0">&#93;</span> <span class="sy0">=</span> <span class="kw2">new</span> Array<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; <span class="kw1">return</span> arr<span class="sy0">;</span><br />
          <span class="br0">&#125;</span><br />
          <br />
          <span class="kw2">function</span> extract<span class="br0">&#40;</span> table_id <span class="br0">&#41;</span><br />
          <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw2">var</span> table <span class="sy0">=</span> document.<span class="me1">getElementById</span><span class="br0">&#40;</span> table_id <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="kw2">var</span> trs <span class="sy0">=</span> table.<span class="me1">getElementsByTagName</span><span class="br0">&#40;</span> <span class="st0">'tr'</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="kw2">var</span> headers <span class="sy0">=</span> getHeaders<span class="br0">&#40;</span> trs <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="kw2">var</span> myTds <span class="sy0">=</span> <span class="kw2">new</span> Array<span class="br0">&#40;</span> trs.<span class="me1">length</span> <span class="sy0">-</span> <span class="nu0">1</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; myTds <span class="sy0">=</span> initialArray<span class="br0">&#40;</span> myTds <span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span> <span class="kw2">var</span> i <span class="sy0">=</span> <span class="nu0">1</span> <span class="sy0">;</span> i <span class="sy0">&lt;</span> trs.<span class="me1">length</span> <span class="sy0">;</span> i<span class="sy0">++</span> <span class="br0">&#41;</span><br />
          &nbsp; <span class="br0">&#123;</span> <br />
          &nbsp; &nbsp; <span class="kw2">var</span> tds <span class="sy0">=</span> trs<span class="br0">&#91;</span> i <span class="br0">&#93;</span>.<span class="me1">getElementsByTagName</span><span class="br0">&#40;</span> <span class="st0">'td'</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span> <span class="kw2">var</span> j <span class="sy0">=</span> <span class="nu0"></span> <span class="sy0">;</span> j <span class="sy0">&lt;</span> tds.<span class="me1">length</span> <span class="sy0">;</span> j<span class="sy0">++</span> <span class="br0">&#41;</span><br />
          &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; myTds<span class="br0">&#91;</span> i <span class="sy0">-</span> <span class="nu0">1</span> <span class="br0">&#93;</span>.<span class="me1">push</span><span class="br0">&#40;</span> tds<span class="br0">&#91;</span> j <span class="br0">&#93;</span>.<span class="me1">innerHTML</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; <span class="kw1">return</span> getXMLFromArrays<span class="br0">&#40;</span> headers <span class="sy0">,</span> myTds <span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><br />
          <br />
          <span class="kw2">function</span> printXML<span class="br0">&#40;</span><span class="br0">&#41;</span><br />
          <span class="br0">&#123;</span><br />
          &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span> extract<span class="br0">&#40;</span> <span class="st0">'table'</span> <span class="br0">&#41;</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

<pre><div class="codecolorer-container html4strict blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />
        </div>
      </td>
      
      <td>
        <div class="html4strict codecolorer">
          <span class="sc2">&lt;<a href="http://december.com/html/4/element/body.html"><span class="kw2">body</span></a>&gt;</span><br />
          &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/p.html"><span class="kw2">p</span></a>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/input.html"><span class="kw2">input</span></a> <span class="kw3">value</span><span class="sy0">=</span><span class="st0">"Extract!"</span> <span class="kw3">type</span><span class="sy0">=</span><span class="st0">"button"</span> <span class="kw3">onclick</span><span class="sy0">=</span><span class="st0">"printXML();"</span> <span class="sy0">/</span>&gt;</span><br />
          &nbsp; <span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/p.html"><span class="kw2">p</span></a>&gt;</span><br />
          &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/table.html"><span class="kw2">table</span></a> <span class="kw3">id</span><span class="sy0">=</span><span class="st0">"table"</span> <span class="kw3">border</span><span class="sy0">=</span><span class="st0">"1"</span>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/tr.html"><span class="kw2">tr</span></a>&gt;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span>Header1<span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span>Header2<span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/tr.html"><span class="kw2">tr</span></a>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/tr.html"><span class="kw2">tr</span></a>&gt;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span>Value1<span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span>Value2<span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/tr.html"><span class="kw2">tr</span></a>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/tr.html"><span class="kw2">tr</span></a>&gt;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span>Value3<span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span>Value4<span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/tr.html"><span class="kw2">tr</span></a>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/tr.html"><span class="kw2">tr</span></a>&gt;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span>Value5<span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span>Value6<span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/tr.html"><span class="kw2">tr</span></a>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/tr.html"><span class="kw2">tr</span></a>&gt;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span>Value7<span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="sc2">&lt;<a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span>Value8<span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/td.html"><span class="kw2">td</span></a>&gt;</span><br />
          &nbsp; &nbsp; <span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/tr.html"><span class="kw2">tr</span></a>&gt;</span> &nbsp; <br />
          &nbsp; <span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/table.html"><span class="kw2">table</span></a>&gt;</span><br />
          <span class="sc2">&lt;<span class="sy0">/</span><a href="http://december.com/html/4/element/body.html"><span class="kw2">body</span></a>&gt;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>