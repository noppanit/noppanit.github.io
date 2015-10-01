---
title: 'Tutorial : Flex convert object to xml'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-flex-convert-object-to-xml/
dsq_thread_id:
  - 183514115
categories:
  - Flex
  - Knowledges
---
This is CustomerDTO.as that extends DTOBean.as

<pre><div class="codecolorer-container actionscript3 blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />
        </div>
      </td>
      
      <td>
        <div class="actionscript3 codecolorer">
          <span class="kw4">package</span> actionScript<br />
          <span class="br0">&#123;</span><br />
          <br />
          &nbsp; <span class="kw1">public</span> <span class="kw4">class</span> CustomerDTO <span class="kw1">extends</span> DTOBean<br />
          &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw2">var</span> <span class="kw7">name</span><span class="sy0">:</span><a href="http://www.google.com/search?q=string%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:string.html"><span class="kw5">String</span></a><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw2">var</span> surname<span class="sy0">:</span><a href="http://www.google.com/search?q=string%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:string.html"><span class="kw5">String</span></a><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw3">function</span> CustomerDTO<span class="br0">&#40;</span><span class="br0">&#41;</span><br />
          &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          <br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          <br />
          &nbsp; <span class="br0">&#125;</span><br />
          <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

This is the base class for every DTO.

<pre><div class="codecolorer-container actionscript3 blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />
        </div>
      </td>
      
      <td>
        <div class="actionscript3 codecolorer">
          <span class="kw4">package</span> actionScript<br />
          <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw1">public</span> <span class="kw4">class</span> DTOBean<br />
          &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw3">function</span> DTOBean<span class="br0">&#40;</span><span class="br0">&#41;</span><br />
          &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          <br />
          &nbsp; <span class="br0">&#125;</span><br />
          <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

Here is our hero ObjectConverter.as

<pre><div class="codecolorer-container actionscript3 blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />
        </div>
      </td>
      
      <td>
        <div class="actionscript3 codecolorer">
          <span class="kw4">package</span> actionScript<br />
          <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <span class="kw1">import</span> <span class="kw6">flash.xml</span><span class="sy0">.</span><a href="http://www.google.com/search?q=xmldocument%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:xmldocument.html"><span class="kw5">XMLDocument</span></a><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="kw1">import</span> <span class="kw6">flash.xml</span><span class="sy0">.</span><a href="http://www.google.com/search?q=xmlnode%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:xmlnode.html"><span class="kw5">XMLNode</span></a><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; <span class="kw1">import</span> mx<span class="sy0">.</span>rpc<span class="sy0">.</span>xml<span class="sy0">.</span>SimpleXMLEncoder<span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw4">class</span> ObjectConverter<br />
          &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw3">function</span> ObjectConverter<span class="br0">&#40;</span><span class="br0">&#41;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          <br />
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="coMULTI">/**<br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* &nbsp;Converting DTO Bean object to XML<br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw3">function</span> objectToXML<span class="br0">&#40;</span>dtoBean<span class="sy0">:</span>DTOBean<span class="br0">&#41;</span><span class="sy0">:</span><a href="http://www.google.com/search?q=xml%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:xml.html"><span class="kw5">XML</span></a><br />
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw2">var</span> qName<span class="sy0">:</span><a href="http://www.google.com/search?q=qname%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:qname.html"><span class="kw5">QName</span></a> = <span class="kw1">new</span> <a href="http://www.google.com/search?q=qname%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:qname.html"><span class="kw5">QName</span></a><span class="br0">&#40;</span><span class="st0">"form"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw2">var</span> xmlDocument<span class="sy0">:</span><a href="http://www.google.com/search?q=xmldocument%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:xmldocument.html"><span class="kw5">XMLDocument</span></a> = <span class="kw1">new</span> <a href="http://www.google.com/search?q=xmldocument%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:xmldocument.html"><span class="kw5">XMLDocument</span></a><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw2">var</span> simpleXMLEncoder<span class="sy0">:</span>SimpleXMLEncoder = <span class="kw1">new</span> SimpleXMLEncoder<span class="br0">&#40;</span>xmlDocument<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw2">var</span> xmlNode<span class="sy0">:</span><a href="http://www.google.com/search?q=xmlnode%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:xmlnode.html"><span class="kw5">XMLNode</span></a> = simpleXMLEncoder<span class="sy0">.</span>encodeValue<span class="br0">&#40;</span>dtoBean<span class="sy0">,</span> qName<span class="sy0">,</span> xmlDocument<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw2">var</span> xml<span class="sy0">:</span><a href="http://www.google.com/search?q=xml%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:xml.html"><span class="kw5">XML</span></a> = <span class="kw1">new</span> <a href="http://www.google.com/search?q=xml%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:xml.html"><span class="kw5">XML</span></a><span class="br0">&#40;</span>xmlDocument<span class="sy0">.</span><span class="kw7">toString</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">return</span> xml<span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

The last one

<pre><div class="codecolorer-container actionscript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />
        </div>
      </td>
      
      <td>
        <div class="actionscript codecolorer">
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw3">import</span> mx.<span class="me1">controls</span>.<span class="me1">Alert</span>;<br />
          &nbsp; <span class="kw3">import</span> actionScript.<span class="me1">ObjectConverter</span>;<br />
          &nbsp; <span class="kw3">import</span> actionScript.<span class="me1">CustomerDTO</span>;<br />
          <br />
          &nbsp; <span class="kw2">var</span> converter:ObjectConverter = <span class="kw2">new</span> ObjectConverter<span class="br0">&#40;</span><span class="br0">&#41;</span>;<br />
          &nbsp; <br />
          &nbsp; <span class="kw2">var</span> customer:CustomerDTO = <span class="kw2">new</span> CustomerDTO<span class="br0">&#40;</span><span class="br0">&#41;</span>;<br />
          &nbsp; customer.<span class="kw3">name</span> = <span class="st0">"Noppanit"</span>;<br />
          &nbsp; customer.<span class="me1">surname</span> = <span class="st0">"Charassinvichai"</span>;<br />
          &nbsp; <br />
          &nbsp; <span class="kw2">var</span> <span class="kw3">xml</span>:<span class="kw3">XML</span> = converter.<span class="me1">objectToXML</span><span class="br0">&#40;</span> customer <span class="br0">&#41;</span>;<br />
          &nbsp; &nbsp; &nbsp; <br />
          &nbsp; Alert.<span class="kw3">show</span><span class="br0">&#40;</span> <span class="kw3">xml</span>.<span class="me1">toXMLString</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#41;</span>;
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

<div class="zemanta-pixie">
  <img class="zemanta-pixie-img" src="http://img.zemanta.com/pixy.gif?x-id=fb3e0ddf-c7e1-8beb-bd0f-5df717060cdf" alt="" />
</div>