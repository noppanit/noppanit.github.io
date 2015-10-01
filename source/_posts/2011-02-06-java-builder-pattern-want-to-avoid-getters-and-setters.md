---
title: 'Java Builder Pattern: Want to avoid getters and setters to create an object?'
author: Noppanit Charassinvichai
layout: post
permalink: /java-builder-pattern-want-to-avoid-getters-and-setters/
dsq_thread_id:
  - 223792608
categories:
  - Java
---
Have you ever get bored of setting lots of properties to create an object? Have you ever considered an alternate way to create an object? Well, I got one. It&#8217;s called Builder Pattern. It&#8217;s another way to create an object. I&#8217;m trying to make this as easier as possible but I will need to be technical as well. So, here is a simple of builder diagram.

<div style="width: 543px" class="wp-caption alignnone">
  <img alt="Builder Pattern" src="http://upload.wikimedia.org/wikipedia/en/6/6e/Builder2.png" title="Builder Pattern" width="533" height="240" />
  
  <p class="wp-caption-text">
    Builder Pattern Diagram
  </p>
</div>

Start from **Builder**  
Builder is the abstract class where you form a skeleton of a object you want to create; in other words, a base class for every concreate builder.

**Concrete Builder**  
Concrete Builder classes are extended from the Builder.

**Director**  
The Director class is to control everything and responsible to control the sequence of object creation. 

**Product**  
Product can be seen as the model class.

However, it will be easier if you look at the example below.  
First let&#8217;s create a Product class

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />33<br />34<br />35<br />36<br />37<br />38<br />39<br />40<br />41<br />42<br />43<br />44<br />45<br />46<br />47<br />48<br />49<br />50<br />51<br />52<br />53<br />54<br />55<br />56<br />57<br />58<br />59<br />60<br />61<br />62<br />63<br />64<br />65<br />66<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> <span class="kw1">class</span> Car<br /> <span class="br0">&#123;</span><br /> &nbsp; <span class="kw1">private</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> name<span class="sy0">;</span><br /> &nbsp; <span class="kw1">private</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> description<span class="sy0">;</span><br /> &nbsp; <span class="kw1">private</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> model<span class="sy0">;</span><br /> &nbsp; <br /> &nbsp; <span class="co3">/**<br /> &nbsp; &nbsp;* Get the name<br /> &nbsp; &nbsp;*<br /> &nbsp; &nbsp;* @return the name<br /> &nbsp; &nbsp;*/</span><br /> &nbsp; <span class="kw1">public</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> getName<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">return</span> name<span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="co3">/**<br /> &nbsp; &nbsp;* Set the name<br /> &nbsp; &nbsp;*<br /> &nbsp; &nbsp;* @param name the name to set<br /> &nbsp; &nbsp;*/</span><br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> setName<span class="br0">&#40;</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> name<span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">this</span>.<span class="me1">name</span> <span class="sy0">=</span> name<span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="co3">/**<br /> &nbsp; &nbsp;* Get the description<br /> &nbsp; &nbsp;*<br /> &nbsp; &nbsp;* @return the description<br /> &nbsp; &nbsp;*/</span><br /> &nbsp; <span class="kw1">public</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> getDescription<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">return</span> description<span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="co3">/**<br /> &nbsp; &nbsp;* Set the description<br /> &nbsp; &nbsp;*<br /> &nbsp; &nbsp;* @param description the description to set<br /> &nbsp; &nbsp;*/</span><br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> setDescription<span class="br0">&#40;</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> description<span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">this</span>.<span class="me1">description</span> <span class="sy0">=</span> description<span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="co3">/**<br /> &nbsp; &nbsp;* Get the model<br /> &nbsp; &nbsp;*<br /> &nbsp; &nbsp;* @return the model<br /> &nbsp; &nbsp;*/</span><br /> &nbsp; <span class="kw1">public</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> getModel<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">return</span> model<span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="co3">/**<br /> &nbsp; &nbsp;* Set the model<br /> &nbsp; &nbsp;*<br /> &nbsp; &nbsp;* @param model the model to set<br /> &nbsp; &nbsp;*/</span><br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> setModel<span class="br0">&#40;</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> model<span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">this</span>.<span class="me1">model</span> <span class="sy0">=</span> model<span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Then we create an abstract class to be a base class

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> <span class="kw1">abstract</span> <span class="kw1">class</span> FactoryAbstract<br /> <span class="br0">&#123;</span><br /> &nbsp; <span class="kw1">protected</span> Car car<span class="sy0">;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> createACar<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">this</span>.<span class="me1">car</span> <span class="sy0">=</span> <span class="kw1">new</span> Car<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">public</span> Car getCar<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">return</span> <span class="kw1">this</span>.<span class="me1">car</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">public</span> <span class="kw1">abstract</span> <span class="kw4">void</span> buildName<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="kw1">public</span> <span class="kw1">abstract</span> <span class="kw4">void</span> buildDescription<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="kw1">public</span> <span class="kw1">abstract</span> <span class="kw4">void</span> buildModel<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Then, create a concrete class

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> <span class="kw1">class</span> ToyotaCreator <span class="kw1">extends</span> FactoryAbstract<br /> <span class="br0">&#123;</span><br /> <br /> &nbsp; @Override<br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> buildDescription<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; car.<span class="me1">setDescription</span><span class="br0">&#40;</span><span class="st0">"Toyota hybrid-power"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <br /> &nbsp; @Override<br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> buildModel<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; car.<span class="me1">setModel</span><span class="br0">&#40;</span><span class="st0">"Prius"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <br /> &nbsp; @Override<br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> buildName<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; car.<span class="me1">setName</span><span class="br0">&#40;</span><span class="st0">"Toyota"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

The last one is the Director

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> <span class="kw1">class</span> Director<br /> <span class="br0">&#123;</span><br /> &nbsp; <span class="kw1">private</span> FactoryAbstract factory<span class="sy0">;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> setConcreteClass<span class="br0">&#40;</span> FactoryAbstract factoryAbstract <span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">this</span>.<span class="me1">factory</span> <span class="sy0">=</span> factoryAbstract<span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> constructACar<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; factory.<span class="me1">createACar</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; factory.<span class="me1">buildName</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; factory.<span class="me1">buildDescription</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; factory.<span class="me1">buildModel</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">public</span> Car getCar<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">return</span> factory.<span class="me1">getCar</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

And a client to test the pattern

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> <span class="kw1">class</span> Client<br /> <span class="br0">&#123;</span><br /> <br /> &nbsp; <span class="co3">/**<br /> &nbsp; &nbsp;* @param args<br /> &nbsp; &nbsp;*/</span><br /> &nbsp; <span class="kw1">public</span> <span class="kw1">static</span> <span class="kw4">void</span> main<span class="br0">&#40;</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a><span class="br0">&#91;</span><span class="br0">&#93;</span> args<span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; FactoryAbstract factory <span class="sy0">=</span> <span class="kw1">new</span> ToyotaCreator<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; Director director <span class="sy0">=</span> <span class="kw1">new</span> Director<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; director.<span class="me1">setConcreteClass</span><span class="br0">&#40;</span> factory <span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; director.<span class="me1">constructACar</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <br /> &nbsp; &nbsp; Car aCar <span class="sy0">=</span> director.<span class="me1">getCar</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <br /> &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Asystem+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">System</span></a>.<span class="me1">out</span>.<span class="me1">println</span><span class="br0">&#40;</span> <span class="st0">"Name: "</span> <span class="sy0">+</span> aCar.<span class="me1">getName</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Asystem+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">System</span></a>.<span class="me1">out</span>.<span class="me1">println</span><span class="br0">&#40;</span> <span class="st0">"Description: "</span> <span class="sy0">+</span> aCar.<span class="me1">getDescription</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Asystem+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">System</span></a>.<span class="me1">out</span>.<span class="me1">println</span><span class="br0">&#40;</span> <span class="st0">"Model: "</span> <span class="sy0">+</span> aCar.<span class="me1">getModel</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>