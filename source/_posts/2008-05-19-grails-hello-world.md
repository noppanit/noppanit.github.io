---
title: 'Grails : Hello world'
author: Noppanit Charassinvichai
layout: post
permalink: /grails-hello-world/
dsq_thread_id:
  - 185889636
categories:
  - Grails
---
<p style="text-align: left;">
  So, I guess this is the beginning of every language, The hello world. No books can be finished without having &#8220;HelloWorld&#8221;.
</p>

<p style="text-align: left;">
  So, after the installation of Grails, according to this topic <a href="http://www.noppanit.com/?p=111">http://www.noppanit.com/?p=111</a> we&#8217;re going to build Hello world project.
</p>

<p style="text-align: left;">
  1. Setup grails path.<br /> 2. run the script, <strong>grails</strong> <strong>create-app hello.</strong><br /> 3. You will see the directory hello you have just created.<br /> 4. create a controller, name hello by typing <strong>grails</strong> <strong>create-controller hello</strong> under the hello directory.<br /> 5. So now, you have one web application and one controller.<br /> 6. open HelloController.groovy in &#8230;\grails-app\controllers<strong>\HelloController.groovy</strong>, you can use your favourite IDE, but I&#8217;m using Eclipse.<br /> 7. Insert this line
</p>

<div class="codecolorer-container groovy blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="groovy codecolorer">
          <a href="http://www.google.de/search?q=site%3Agroovy.codehaus.org/%20def"><span class="kw2">def</span></a> world <span class="br0">&#123;</span><br /> &nbsp; &nbsp; render <span class="st0">'Hello World, It'</span>s<span class="st0">' + new java.util.Date()<br /> }</span>
        </div>
      </td>
    </tr>
  </table>
</div>

8. You can see that I&#8217;m using java.util.Date(), yeah right!!, because grails has been tighted with Java.  
9. Test your application by typing, **grails run-app, **grails will use Jetty as a Application Server.  
10. You can change your controller without rebooting the Application Server. Isn&#8217;t that good? Haha.  
11. Bam!!! your first web application without any configurations.