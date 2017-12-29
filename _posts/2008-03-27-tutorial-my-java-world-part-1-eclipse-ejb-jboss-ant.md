---
title: 'Tutorial : My Java World Eclipse + EJB + JBoss + Ant.  Part 1'
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-my-java-world-part-1-eclipse-ejb-jboss-ant/
dsq_thread_id:
  - 206181672
categories:
  - Java
---
Now, I have been struggling in job finding world. I tested a lot, and all about J2EE blah blah and I completely failed. So, I decided to write this topic to record my understand about EJB. I will program EJB from scratch, without using any tools, or as less as possible.

I am using these tools  
1. [Eclipse][1]  
2. J2EE 5.04  
3. [JBoss 4.22][2]  
4. Ant 1.7

First thing first after you installed JDK, you have to set variables in. Control Panel -> System -> Advance -> Environment Variables. Like the picture below.

![][3]

After I have set the JAVA_HOME variable, the next thing is I have to create an EJB project.

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/2.jpg" height="523" width="618" />

You will get something like this

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/3.jpg" height="252" width="246" />

The Next thing is, you have to add J2EE library to the project. So, all the J2EE jars can be used in the project. The jars come from C:\Sun\SDK\lib <&#8211; according to my computer, which installed J2EE 5.04

![][4]

In this project, I&#8217;m using Remote interface, because I wanted to show how the EJB can be connected via another J2EE container. So, After importing the j2EE jars, we have to create two interfaces which are Remote interface and Remote home interface. I&#8217;m creating com.noppanit.interfaces and com.noppanit.bean package. The bean package is for SessionBean.

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/5.jpg" height="259" width="352" />

HelloEJB.java is a Remote interface. It has to extend javax.ejb.EJBObject and has business method interface which throws RemoteException. Like this.

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/6.jpg" height="217" width="533" />

HelloEJBHome.java is a Remote home interface. It has to extend javax.ejb.EJBHome and has at least one creat(); method which return the Remote interface and throws RemoteException, CreateException.

![][5]

The last one is SessionBean. It has to implement javax.ejb.SessionBean and has ejbActivate, ejbPassivate, ejbRemove, setSessionContext, and business methods.

[<img src="http://i2.photobucket.com/albums/y41/newbie_toy/81.jpg" height="216" width="200" />][6]

The next thing is ejb-jar.xml. It&#8217;s a deployment descriptor. This xml file is for J2EE container, the file will be looked by the J2EE container. So, it can know that what type of this EJB is, and what is the name of this EJB, etc.

[<img src="http://i2.photobucket.com/albums/y41/newbie_toy/91.jpg" height="74" width="200" />][7]

Now, the process of creating EJB is finished. The next thing is, we have to create build.xml, an ANT file. The ANT file is used for cleaning, compiling, deploying to application server. Actually, we can use Eclipse to do all these things, but I want to create this project from scratch.

[<img src="http://i2.photobucket.com/albums/y41/newbie_toy/101.jpg" height="203" width="200" />][8]

After the deploying, jboss should see the EJB in its container and is ready to be used via JNDI.?? the next Chapter I will be using ordinary Java application client call the EJB. Actually, we must use web container to call the EJB.

 [1]: http://www.eclipse.org/downloads/
 [2]: http://labs.jboss.com/projects/download/
 [3]: http://i2.photobucket.com/albums/y41/newbie_toy/1.jpg
 [4]: http://i2.photobucket.com/albums/y41/newbie_toy/4.jpg
 [5]: http://i2.photobucket.com/albums/y41/newbie_toy/7.jpg
 [6]: http://i2.photobucket.com/albums/y41/newbie_toy/8.jpg
 [7]: http://i2.photobucket.com/albums/y41/newbie_toy/9.jpg
 [8]: http://i2.photobucket.com/albums/y41/newbie_toy/10.jpg