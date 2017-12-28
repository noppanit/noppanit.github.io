---
title: My thoughts on Play 2.1.1 (Java)
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /my-thoughts-on-play-2-1-1-java/
dsq_thread_id:
  - 1456355337
categories:
  - Knowledges
tags:
  - Java
  - play!
---
I have just rolled off from a project using AngularJS and Play 2.1.1. It was a mobile website, I wish I could include the site here as well but it&#8217;s still in development. We are using Play! 2.1.1 Java and AngularJs to build a mobile website. So, I&#8217;d like to summarise my thoughts here.

# Play Framework 2.1.1

It&#8217;s a really good framework if you want to start something quickly. It&#8217;s like Rail in Java. You have everything in this framework, ORM, LESS, RequireJS and also some caching strategy. If in the future, I have a requirement to create a prototype in Java I would choose this framework for sure (Who would create a prototype in Java anyways), buy hey! it can be that who knows. By the way, there are some downsides. As Play considers everything in static. That makes testing quite tricky. For example, every controller is statically created, if you want to have something injected to your controller you have to create a custom global configuration for Play!. Here&#8217;s the example.

```
# Global object class
# ~~~~~
# Define the Global object class for this application.
# Default to Global in the root package.
application.global=global.CustomGlobal
```

``` java
package global;

// CAUTION: this class name must be specified in application.conf
public class CustomGlobal extends GlobalSettings {
   private static MutablePicoContainer dependencies = wireUpDependencies();

   private static MutablePicoContainer wireUpDependencies() {
         MutablePicoContainer container = new DefaultPicoContainer();
         // Do some injections.
   }
   @Override
    public <A> A getControllerInstance(Class<A> aControllerClass) throws Exception {
        return dependencies.getComponent(aControllerClass);
    }
}
```

Then in **/routes** you can use **@** to say not create a controller statically.

```
GET     /                               @controllers.coop.main.Application.index(any = "none")
```

Other thing is EBean which comes with Play!. EBean is built on top of JPA. However, this means you have to learn a new framework if you know Hibernate already. They are quite close. Other than that, I think Play! is great. If you have time you might want to have a look at [DropWizard][1] if you just want to create a RESTFul service or [SPARK][2] for a sinatra-like java framework. 

## EBean Query tuning

EBean is like another version of Hibernate. It&#8217;s basically an ORM framework. There&#8217;s a catch in EBean if you turn the showing query on and if you join two or three tables and you use RawSql EBean will fire a lot of query to fetch each and every row you want to use. You will see a massive log. That hurts the performance. If you could use basic EBean for example.

``` java
List<Order> orders =   
    Ebean.find(Order.class)  
        .fetch("customer")  
        .findList();
```

If you use .fetch(&#8220;customer&#8221;) it will just fire one query. So be careful. If you see a performance hit in your app and if it&#8217;s because of database. Check this [link][3]. So, keep an eye on your performance because the peak might be on your query.

## Conclusion

Play! is a good framework for doing something really quick and you don&#8217;t want to get your hands dirty with Spring or pure Java servlet. My biggest catch for Play! for me is the ability to write tests and to inject something to a controller. That means it&#8217;s hard to write unit-test but you can still write integration tests. If you&#8217;re ok with this fact I guess Play! is a good framework to look out for. 

Also, Play! documentation is quite incomplete. And every version is really different than the prior version. So, please be careful to choose the write version of your documentation otherwise you might be scratching your head for a long time until you figure it out you&#8217;re looking at the wrong documentation.

 [1]: http://dropwizard.codahale.com/ "DropWizard"
 [2]: http://www.sparkjava.com/download.html "SPARK"
 [3]: http://www.avaje.org/ebean/introquery_joinquery.html "EBean join query."
