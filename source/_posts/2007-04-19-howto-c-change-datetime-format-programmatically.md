---
title: 'HowTo : C# change DateTime format programmatically'
author: Noppanit Charassinvichai
layout: post
permalink: /howto-c-change-datetime-format-programmatically/
dsq_thread_id:
  - 199843305
categories:
  - .NET
  - Programming
---
When you use Datetime. Now in c#, it&#8217;ll give u a datetime as same as in your computer configured. If you want to change it by programmatically. use the following code.

<div class="codecolorer-container csharp blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="csharp codecolorer">
          <span class="kw1">using</span> <span class="co3">System.Globalization</span><span class="sy0">;</span><br /> <br /> <span class="kw1">private</span> DateTime dt <span class="sy0">=</span> DateTime<span class="sy0">.</span><span class="me1">Now</span><span class="sy0">;</span><br /> <span class="kw1">private</span> DateTimeFormatInfo &nbsp;dfi <span class="sy0">=</span> <a href="http://www.google.com/search?q=new+msdn.microsoft.com"><span class="kw3">new</span></a> DateTimeFormatInfo<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="kw1">private</span> CultureInfo ci <span class="sy0">=</span> <a href="http://www.google.com/search?q=new+msdn.microsoft.com"><span class="kw3">new</span></a> CultureInfo<span class="br0">&#40;</span><span class="st0">"th-TH"</span><span class="br0">&#41;</span><span class="sy0">;</span> <span class="co1">// Change where is you culture do you want</span><br /> <br /> Console<span class="sy0">.</span><span class="me1">WriteLine</span><span class="br0">&#40;</span>dt<span class="sy0">.</span><span class="me1">ToString</span><span class="br0">&#40;</span><span class="st0">"d"</span>,ci<span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

<p align="left">
  Reference : <a href="http://msdn2.microsoft.com/en-us/library/az4se3k1%28VS.71%29.aspx">http://msdn2.microsoft.com/en-us/library/az4se3k1(VS.71).aspx </a>
</p>