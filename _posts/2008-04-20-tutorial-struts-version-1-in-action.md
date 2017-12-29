---
title: 'Tutorial : Struts version 1 in action'
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 330021411
categories:
  - Struts
tags:
  - Struts
---
From the previous chapter, I wrote about how to build an EJB from scratch. This topic, I will be presenting how to combine struts version 1 with the previous topic.

First, we need the latest <a href="http://struts.apache.org/download.cgi#struts138" target="_blank">struts version 1</a>. Actually, I wanted to write about struts2, but I don&#8217;t have enough energy to do that, because struts version2 is very difference to version1. So, I will write version 1 first and then migrate to version2 later.

<a href="http://www.roseindia.net/struts/struts1-vs-struts2.shtml" target="_blank">This is the difference between Struts1 and Struts2</a>

<a href="http://www.roseindia.net/struts/struts1-vs-struts2.shtml" target="_blank"><img src="http://i2.photobucket.com/albums/y41/newbie_toy/1-1.gif" alt="" width="232" height="288" /></a>

So, First we need to look at the hierarchy of the project. We have

**src folder**: where you can keep your .java files.  
**WebContent folder:** where you can keep your content files, such as .jsp files and libs. In WebContent we have to create WEB-INF to store web.xml and struts-config.xml to tell struts that we are using Struts Framework. **  
WebContent/WEB-INF/classes** **folder**: this folder we can keep our .class files.

The next thing is we have to modified web.xml to tell java that we are going to use Struts and configure about struts-config.xml.

<a href="http://i2.photobucket.com/albums/y41/newbie_toy/2-1.gif" target="_blank"><img src="http://i2.photobucket.com/albums/y41/newbie_toy/2-1-1.gif" alt="" width="150" height="132" /></a>

Next, modified the index.jsp to use struts taglib

<a href="http://i2.photobucket.com/albums/y41/newbie_toy/3-1.gif" target="_blank"><img src="http://i2.photobucket.com/albums/y41/newbie_toy/3-1-1.gif" alt="" width="150" height="82" /></a>

Now, we are heading to code the main program. I have created TestStrutsEJBAction.java which is extended from org.apache.struts.action.Action in Struts1 we have to extend org.apache.struts.action.Action, but in Struts2 we don&#8217;t have to extend Action, just the class that implements execute method.

<a href="http://i2.photobucket.com/albums/y41/newbie_toy/4-1.gif" target="_blank"><img src="http://i2.photobucket.com/albums/y41/newbie_toy/4-1-1.gif" alt="" width="150" height="146" /></a>

After we have created Action class we have to create ActionForm that request the parameters from the form, or jsp file. This class have to extend ActionForm, or we can develop more than that by extending ValidateForm. This class have to have parameters that the names match the jsp file inside html:form.

![][1]

The last thing is the key file, struts-config.xml

<a href="http://i2.photobucket.com/albums/y41/newbie_toy/6-1.gif" target="_blank"><img src="http://i2.photobucket.com/albums/y41/newbie_toy/6-1-1.gif" alt="" /></a>

This is the end, the next thing is we pack this project and deploy to application server. We can use ANT or any framework you like.

<a href="http://i2.photobucket.com/albums/y41/newbie_toy/7-1.gif" target="_blank"><img src="http://i2.photobucket.com/albums/y41/newbie_toy/71.gif" alt="" width="150" height="81" /></a>

This is the example of my build.xml file, I use ANY, because I want to build my project from scratch. If you can use Eclipse to deploy to the application server, that&#8217;s fine. In build.xml I use war task to pack all the files you needed to WAR.

So, I can summary into the following steps 

1. Create Struts project and include all the filed the project need, such as struts libraries.  
2. Config web.xml and struts.xml  
3. Write Jsp file, modified by using struts taglib, you can use plain html if you want.  
4. Write Action class which extends org&#8230;struts.action.Action.  
5. Write ActionForm which extends org&#8230;struts.action.ActionForm.  
6. Pack the project into war file.  
7. Deploy into application server.

Next topic, I will be improving this project by using AJAX.

 [1]: http://i2.photobucket.com/albums/y41/newbie_toy/5-1.gif
