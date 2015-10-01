---
title: 'How to : Java add custom annotation'
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-java-add-custom-annotation/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/bqOHXO
wp_jd_target:
  - http://www.noppanit.com/how-to-java-add-custom-annotation/
dsq_thread_id:
  - 184044200
categories:
  - Java
---
From Java 5, there is a new feature called annotation that provided easier to tag or mark class or method. For example, in JUnit we can ust @Test above a method to let the JUnit engine knows that this class is a test case. Moreover, we can also implement our own annotation as well. 

Reference: <http://technicalmumbojumbo.wordpress.com/2008/01/13/java-custom-annotations/>

Java Reference: <http://download.oracle.com/javase/1.5.0/docs/guide/language/annotations.html>

I used that reference to implement my own annotation at the first place, but I&#8217;m going to memorise that as well in this post.

First, you need to create a new class and make it annotation.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          @Target<span class="br0">&#40;</span>ElementType.<span class="me1">TYPE</span><span class="br0">&#41;</span><br /> <span class="kw1">public</span> @<span class="kw1">interface</span> IgnoreClass<br /> <span class="br0">&#123;</span><br /> <br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

The code above will let the java compiler knows that this class is an annotation. You will notice that instead of writing public class IgnoreClass, we write @interface to let the compiler knows. Above that we see @Target and @Retention. First @Target is a tag where we tell the compiler that this annotation can be used in Class, Method Or Field. This is the options we can use.

TYPE: Class, interface, or enum (not annotation)  
FIELD: member fields (including enum values)  
METHOD: methods (does not include constrcutors)  
PARAMETER: method parameter  
CONSTRUCTOR: constructor  
LOCAL_VARIABLE: local variable or catch clause  
ANNOTATION_TYPE: Annotation types  
PACKAGE: java package

That&#8217;s it, now we have our own annotation to use, we can also have fields in annotation as well. 

So this is how we use the annotation

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          @IgnoreClass<br /> <span class="kw1">public</span> <span class="kw1">class</span> AClass<br /> <span class="br0">&#123;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

And this is how we check that the class has such annotation

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">Class</span><span class="br0">&#91;</span><span class="br0">&#93;</span> classes <span class="sy0">=</span> <span class="br0">&#123;</span>AClass.<span class="kw1">class</span><span class="br0">&#125;</span><span class="sy0">;</span><br /> <span class="kw1">for</span> <span class="br0">&#40;</span><span class="kw1">Class</span> classObj <span class="sy0">:</span> classes<span class="br0">&#41;</span> <br /> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp;<a href="http://www.google.com/search?hl=en&q=allinurl%3Aannotation+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Annotation</span></a><span class="br0">&#91;</span><span class="br0">&#93;</span> annotations <span class="sy0">=</span> classObj.<span class="me1">getAnnotations</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp;<span class="co1">// And then we can loop through this array and cast back to the annotation we want.</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

This is a very easy example for creating our own annotation. There are lots of things you can do with annotation. So, you might want to have a look more at the references above.