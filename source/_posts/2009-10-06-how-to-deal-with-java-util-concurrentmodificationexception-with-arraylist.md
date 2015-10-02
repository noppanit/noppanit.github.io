---
title: How to deal with java.util.ConcurrentModificationException with ArrayList
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-deal-with-java-util-concurrentmodificationexception-with-arraylist/
dsq_thread_id:
  - 183380124
categories:
  - Java
---
It is literally occurred when you needed to modify the list while you are iterating it in the same time.  
I have two options for you to consider and use at your own risk.

This is the example that cause an error

``` java
import java.util.ArrayList;
import java.util.List;

public class TestAddRemoveList
{

  public static void main( String args[] )
  {
    List< String > list = new ArrayList< String >();
    list.add("A");
    list.add("B");
    
    for( String str : list )
    {
      if( str.equals( "B" ) )
      {
        list.remove( new String("B" ) );
      }
    }
  }
}
```

This is the first option you could use [CopyOnWriteArrayList][1] but there are some drawbacks too. This is the modified result and it worked for me. 

``` java
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class TestAddRemoveList
{

  public static void main( String args[] )
  {
    List< String > list = new CopyOnWriteArrayList< String >();
    list.add("A");
    list.add("B");
    
    for( String str : list )
    {
      if( str.equals( "B" ) )
      {
        list.remove( new String("B" ) );
      }
    }
  }
}
```

This is the other option. You could you iterator to modify the list

``` java
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TestAddRemoveList
{

  public static void main( String args[] )
  {
    List< String > list = new ArrayList< String >();
    list.add("A");
    list.add("B");
    list.add("C");
    
    for( Iterator< String > it = list.iterator(); it.hasNext() ; )
    {
      String str = it.next();
      if( str.equals( "B" ) )
      {
        it.remove();
      }
    }
    
    for( String str : list )
    {
      System.out.println( str );
    }
  }
}
```

 [1]: http://java.sun.com/javase/6/docs/api/java/util/concurrent/CopyOnWriteArrayList.html
