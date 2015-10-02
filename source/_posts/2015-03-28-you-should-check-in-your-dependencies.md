---
title: You should check in your dependencies.
author: Noppanit Charassinvichai
layout: post
permalink: /you-should-check-in-your-dependencies/
dsq_thread_id:
  - 3634883924
categories:
  - Knowledges
---
I&#8217;m not sure who started this pattern so I can&#8217;t really refer back but if you know please comment below and I will update the post. I&#8217;m sure all of you have heard that you should not check in anything that can be generated to Source control. It&#8217;s long been a common pattern. However, lately I have been checking in my dependencies into my source control and it works really well for small to medium project. Here&#8217;s why.

### Isolate you from any network failures.  


I know you might say that it rarely happens to me so why should I care about this. I hear you. It rarely happens to me as well but when it did happen I got really frustrated. Especially, when your CI failed without any reason and you found out that one of your dependencies doesn&#8217;t get downloaded properly. 

### CI failure  


This frustrates me the most and it&#8217;s one of the reasons why I started doing this. More than often that my CI failed and it&#8217;s because of dependencies didn&#8217;t get resolved or compiled properly and people just kept running it over and over again. To eliminate this problem and let CI just run the tests save me a lot of pulling my hair time. 

### Check out and Go!  


This pattern I have learnt while I was working with ThoughtWorks that it&#8217;s so frustrated when you are joining a project and you spend almost half a day just to get your machine up and running and run the build script to download all the dependencies. I believed that&#8217;s one of the reasons why Chef and Puppet exist. It&#8217;s so easy when you checkout a project from your source control and you can start coding right away or even run all the tests. 

I also have this support from my [friend][1]

<blockquote class="twitter-tweet" lang="en">
  <p>
    <a href="https://twitter.com/noppanit">@noppanit</a> I've been a fan of that technique for a long time now.
  </p>
  
  <p>
    &mdash; Scott Myц (@ScottMuc) <a href="https://twitter.com/ScottMuc/status/579739745921724416">March 22, 2015</a>
  </p>
</blockquote>



Srini also pointed out that you shouldn&#8217;t do that for internal project dependencies

<blockquote class="twitter-tweet" lang="en">
  <p>
    <a href="https://twitter.com/ScottMuc">@ScottMuc</a> <a href="https://twitter.com/noppanit">@noppanit</a> agree. It's good for external libraries and toolset libraries. Not good for internal project dependencies.
  </p>
  
  <p>
    &mdash; Srinivasan Raguraman (@sragu) <a href="https://twitter.com/sragu/status/579762369041186816">March 22, 2015</a>
  </p>
</blockquote>

### Conclusion  


I know people might argue that it doesn&#8217;t really work for big project because of the size of the repository. That&#8217;s why I mention small to medium project. It works really well with small projects. Another point to mention is that every developer might have different environment for example, Windows VS Linux which node_modules might not work for both environments. I solve that problem by using Vagrant so everybody has the same environment. 

Inspiration  
<https://www.dzombak.com/blog/2014/03/including-pods-in-source-control.html>

 [1]: http://scottmuc.com/ "Scott Muc"
