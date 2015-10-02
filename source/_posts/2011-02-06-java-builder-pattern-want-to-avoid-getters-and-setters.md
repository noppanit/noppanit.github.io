---
title: 'Java Builder Pattern: Want to avoid getters and setters to create an object?'
comments: true
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

``` java
public class Car
{
	private String name;
	private String description;
	private String model;

	/**
	 * Get the name
	 *
	 * @return the name
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * Set the name
	 *
	 * @param name the name to set
	 */
	public void setName(String name)
	{
		this.name = name;
	}

	/**
	 * Get the description
	 *
	 * @return the description
	 */
	public String getDescription()
	{
		return description;
	}

	/**
	 * Set the description
	 *
	 * @param description the description to set
	 */
	public void setDescription(String description)
	{
		this.description = description;
	}

	/**
	 * Get the model
	 *
	 * @return the model
	 */
	public String getModel()
	{
		return model;
	}

	/**
	 * Set the model
	 *
	 * @param model the model to set
	 */
	public void setModel(String model)
	{
		this.model = model;
	}
}
```

Then we create an abstract class to be a base class

``` java
public abstract class FactoryAbstract
{
	protected Car car;

	public void createACar()
	{
		this.car = new Car();
	}

	public Car getCar()
	{
		return this.car;
	}

	public abstract void buildName();
	public abstract void buildDescription();
	public abstract void buildModel();
}
```

Then, create a concrete class

``` java
public class ToyotaCreator extends FactoryAbstract
{

	@Override
	public void buildDescription()
	{
		car.setDescription("Toyota hybrid-power");
	}

	@Override
	public void buildModel()
	{
		car.setModel("Prius");
	}

	@Override
	public void buildName()
	{
		car.setName("Toyota");
	}
}
```

The last one is the Director

``` java
public class Director
{
	private FactoryAbstract factory;

	public void setConcreteClass( FactoryAbstract factoryAbstract )
	{
		this.factory = factoryAbstract;
	}

	public void constructACar()
	{
		factory.createACar();
		factory.buildName();
		factory.buildDescription();
		factory.buildModel();
	}

	public Car getCar()
	{
		return factory.getCar();
	}
}
```

And a client to test the pattern

``` java
public class Client
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		FactoryAbstract factory = new ToyotaCreator();
		Director director = new Director();
		director.setConcreteClass( factory );
		director.constructACar();

		Car aCar = director.getCar();

		System.out.println( "Name: " + aCar.getName() );
		System.out.println( "Description: " + aCar.getDescription() );
		System.out.println( "Model: " + aCar.getModel() );
	}

}
```
