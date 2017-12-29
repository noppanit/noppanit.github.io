---
title: Dependency Injection with Spring by example
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 212399493
categories:
  - Java
---
I think every developer these days have heard this term &#8220;Dependency Injection&#8221; or &#8220;Inversion of Control&#8221; before Martin Fowler coined the term &#8220;Dependency Injection&#8221;. And how many people are confused by that? Or may be I&#8217;m the only one who does not know what it means by injecting something into something and every developer should be happy about it.

I really recommend you to read this article first by [Martin Folwer][1], he has explained it in a very simple way and easy to understand. Additionally, I cannot think of any simpler example to explain than of Martin&#8217;s article. So, please do read Martin&#8217;s article and Spring in Action for more information.

So, in my example and this is purely from my understanding.

A class student that needs to go to school. You can see that student class is tightly coupled with the class FindARouteToSchool. You can&#8217;t have Student without FindARouteToSchool. This is not so bad, but many developers find it not flexible enough. We need to promote loosely coupled.

``` java
public class Student
{
	FindARouteToSchool findARoute;

	public void goToSchool()
	{
		findARoute = new GoByBus();
		findARoute.go();
	}

	public static void main ( String args[] )
	{
		new Student().goToSchool();
	}

}
```

So, we need something that can inject something into the Student class, so the class is not dependent to FindARouteToSchool. I have chosen Spring to solve the problem and create a setter object to set a reference of the class FindARouteToSchool.

This is the new Student class which has one more method to set FindARouteToSchool reference.

``` java
public class Student
{
	FindARouteToSchool findARoute;

	public void setFindARoute(FindARouteToSchool findARoute)
	{
		this.findARoute = findARoute;
	}

	public void goToSchool()
	{
		findARoute.go();
	}

	public static void main ( String args[] )
	{
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-idol.xml");
		Student student = (Student) ctx.getBean("student");
		student.goToSchool();
	}
}
```

This is the XML configure file of Spring

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans 
  http://www.springframework.org/schema/beans/spring-beans-2.0.xsd">
  
  <bean id="goByTube"
    class="com.noppanit.GoByTube"/>

  <bean id="student" class="com.noppanit.Student" >
    <property name="findARoute" ref="goByTube"></property>
  </bean>
</beans>
```

 [1]: http://www.martinfowler.com/articles/injection.html
