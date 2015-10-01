---
title: 'HowTo : C# .NET 2005 Convert IList<> to IList'
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-c-net-2005-convert-ilist-to-ilist/
dsq_thread_id:
  - 243603016
categories:
  - .NET
  - Programming
---
As everybody knows that .NET 2005 has the newest thing call Generic, like in JAVA. This is how to convert IList<> to IList

<div class="codecolorer-container csharp blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />
        </div>
      </td>
      
      <td>
        <div class="csharp codecolorer">
          <span class="kw1">protected</span> <span class="kw1">static</span> List ConvertToGenericList<span class="br0">&#40;</span>IList listObjects<span class="br0">&#41;</span><br /> <span class="br0">&#123;</span><br /> &nbsp; List convertedList <span class="sy0">=</span> <span class="sy0"><</span>font color<span class="sy0">=</span><span class="st0">"blue"</span><span class="sy0">></span><a href="http://www.google.com/search?q=new+msdn.microsoft.com"><span class="kw3">new</span></a><span class="sy0"></</span>font<span class="sy0">></span> List<span class="br0">&#40;</span>listObjects<span class="sy0">.</span><span class="me1">Count</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="kw1">foreach</span> <span class="br0">&#40;</span><span class="kw4">object</span> listObject <span class="kw1">in</span> listObjects<span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; convertedList<span class="sy0">.</span><span class="me1">Add</span><span class="br0">&#40;</span><span class="br0">&#40;</span>T<span class="br0">&#41;</span> listObject<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="kw1">return</span> convertedList<span class="sy0">;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

<pre lang="cpp">Reference : <a href="http://dimapasko.spaces.live.com/blog/cns!19D0AD1FA1CDA8!138.entry">http://dimapasko.spaces.live.com/blog/cns!19D0AD1FA1CDA8!138.entry </a></pre>