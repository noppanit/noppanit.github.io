---
title: 'Tutorial C# : Build web service from scratch in C# express'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-c-build-web-service-from-scratch-in-c-express/
jd_tweet_this:
  - yes
dsq_thread_id:
  - 183462513
categories:
  - .NET
---
I have a very serious problem. I wanted to create a web service in C#, but my company won&#8217;t allow be to install illegal products. So, I have to install C# express edition, and one thing led to another. C# express doesn&#8217;t provide me a WebService template. Therefore, let&#8217;s roll up my sleeves and get it done.

The first thing you need to do is register the v2 .NET framework with IIS.  
Run &#8220;aspnet_regiis.exe&#8221; found in &#8220;C:\WINDOWS\Microsoft.NET\Framework\v2.0.40607&#8221;

Now make a new Class Library project in C# express.  
Add the System.Web.Services reference to the project

Create a new class that you want to be your web service.  
Add &#8220;using System.Web.Services;&#8221; to the top of the .cs file  
Make your class inherit from &#8220;System.Web.Services.WebService&#8221;  
Add the [WebMethod] attribute to any methods you want to expose via the web service

e.g.

<div class="codecolorer-container csharp blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />
        </div>
      </td>
      
      <td>
        <div class="csharp codecolorer">
          <span class="kw1">using</span> <span class="co3">System</span><span class="sy0">;</span><br /> <span class="kw1">using</span> <span class="co3">System.Web.Services</span><span class="sy0">;</span><br /> <br /> <span class="kw1">namespace</span> Examples<br /> <span class="br0">&#123;</span><br /> &nbsp; <span class="kw1">public</span> <span class="kw4">class</span> MyWebService <span class="sy0">:</span> WebService<br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="br0">&#91;</span>WebMethod<span class="br0">&#93;</span><br /> &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw4">string</span> SayHello<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; <span class="kw1">return</span> <span class="st0">"Hello World"</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span> <br /> &nbsp; <span class="br0">&#125;</span><br /> <br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Save and compile the project.

Make a new directory in c:\inetpub\wwwroot (or where ever you put you web pages). Call it &#8220;MyWebServices&#8221; or something. Create a sub-directory called &#8220;bin&#8221;.

Next add a new virtual directory to IIS that points to the &#8220;MyWebServices&#8221; directory you just made.

In the &#8220;MyWebServices&#8221; directory create a new file called &#8220;MyWebService.asmx&#8221;. Add the following line:

<div class="codecolorer-container xml blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="xml codecolorer">
          <span class="sc3"><%@ WebService <span class="re0">Language</span>=<span class="st0">"c#"</span> <span class="re0">Codebehind</span>=<span class="st0">"MyWebService.cs"</span> <span class="re0">Class</span>=<span class="st0">"Examples.MyWebService"</span> %<span class="re2">></span></span>
        </div>
      </td>
    </tr>
  </table>
</div>

Create a &#8220;web.config&#8221; file, add the following lines:

<div class="codecolorer-container xml blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="xml codecolorer">
          <span class="sc3"><span class="re1"><?xml</span> <span class="re0">version</span>=<span class="st0">"1.0"</span> <span class="re0">encoding</span>=<span class="st0">"utf-8"</span><span class="re2">?></span></span><br /> <span class="sc3"><span class="re1"><configuration<span class="re2">></span></span></span><br /> &nbsp; <span class="sc3"><span class="re1"><system.web<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><compilation</span> <span class="re0">defaultLanguage</span>=<span class="st0">"c#"</span> <span class="re2">/></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><authentication</span> <span class="re0">mode</span>=<span class="st0">"None"</span> <span class="re2">/></span></span><br /> &nbsp; <span class="sc3"><span class="re1"></system.web<span class="re2">></span></span></span><br /> <span class="sc3"><span class="re1"></configuration<span class="re2">></span></span></span>
        </div>
      </td>
    </tr>
  </table>
</div>

Copy the .cs file, that contains the class, from the C# project to the &#8220;MyWebServices&#8221; directory

Copy the compiled DLL that C# has created into the &#8220;bin&#8221; sub-directory or &#8220;MyWebServices&#8221;

Phew, a bit of leg work but that&#8217;s the basics done.  
Load your web browser and navigate to &#8220;<http://localhost/MyWebServices/MyWebService.asmx>&#8220;.  
You should see the &#8220;SayHello&#8221; method listed. Follow the hyperlink, then click &#8220;Invoke&#8221; to test.  
It should return an XML file with containing the &#8220;Hello World&#8221; message.

That&#8217;s it short and sweet.