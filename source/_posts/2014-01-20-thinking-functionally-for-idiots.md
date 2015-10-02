---
title: Thinking functionally for idiots.
author: Noppanit Charassinvichai
layout: post
permalink: /thinking-functionally-for-idiots/
dsq_thread_id:
  - 2150341429
categories:
  - Java
tags:
  - functional
  - Java
---
I just want to write this post for myself and lucky people who found this post from Google. The world has come to the era of functional. When I pair with my colleagues I always hear &#8220;That&#8217;s not so functional&#8221; or &#8220;Should we use Guava or functional Java&#8221; or &#8220;Wouldn&#8217;t it be easier if we use Scala&#8221;?. What do these mean? Why should I have to care if my code looks functional and what benefits do I get. This post is going to be a really easy post to follow that&#8217;s why the title &#8220;Thinking functionally for idiots&#8221;. If you want more technical I highly recommend this [post][1] from Neal Ford.

**Why functional programming?**  
There are a few concepts of functional programming but you can find the full concepts [here][2]. I don&#8217;t really want to explain about higher-order or first-class functions because someone else can explain it better than myself. In summary, I really think the benefits of doing functional programming is you tend to avoid bugs and the code might be more readable. These can be achieved by avoiding state and mutable data which most of the sites seem to refer to these two benefits. I would like to show this in a simple example.

``` java
List<Integer> numbers = Arrays.asList(1, 2 ,3, 4, 5, 6);

ArrayList<Integer> multipledByTwo = new ArrayList<Integer>();

for(Integer number : numbers) {
	multipledByTwo.add(number * 2);
}
```

You can see that this piece of code is really simple and what it&#8217;s doing is just multiply every element of the list by two. What&#8217;s wrong with this piece of code? First of all, **multipledByTwo** list acts like a temporary list which holds the answer and programmer can do something else with it. 

Let&#8217;s see another example. This is the modified version to be more functional.

``` java
// Interface
public interface Function<S, T> {
    T apply(S in);
}

// MappingClass
public abstract class MappingClass<S, T> {
    protected List<T> map(List<S> list, Function<S, T> fun) {
        List<T> result = new ArrayList<T>();
        for(S item : list) {
            result.add(fun.apply(item));
        }
        return result;
    }
}

// To Test

    public List<Integer> test() {
        List<Integer> numbers = asList(1, 2, 3, 4, 5, 6);
        List<Integer> results = map(numbers, new Function<Integer, Integer>() {
            @Override
            public Integer apply(Integer input) {
                return input * 2;
            }
        });

        return results;
    }
```

We create one generic function which is the interface **Function** this will represent higher-order function which we can parse to another method. Then we create a recursive method which will execute the function and put in another list. This way we don&#8217;t create mutable object and we don&#8217;t retain any state. What comes in the function comes out as the results. 

What do you think? Is this better than the other? If it&#8217;s Java I highly doubt that. Java is still not mature enough to do functional programming. But things are looking better in Java 8.

 [1]: http://www.ibm.com/developerworks/java/library/j-ft1/index.html "Thinking functionally Part I"
 [2]: https://en.wikipedia.org/wiki/Functional_programming#Concepts
