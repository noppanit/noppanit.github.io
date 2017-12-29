---
title: 'How to: Use Junit to test Java Command Line program.'
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 229696940
categories:
  - Java
---
As the topic says and as the code below suggests.
 
``` java
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

import org.junit.Test;

public class TestSystemIN
{

	public static void printName(String name)
	{
		System.out.println("Hello " + name + "\r\n");
	}

	@Test
	public void testPrintName() throws IOException
	{
		// Simulate input
		String data = "John";
		InputStream stdin = System.in;
		try
		{
			System.setIn(new ByteArrayInputStream(data.getBytes()));
			Scanner scanner = new Scanner(System.in);
			String name = scanner.nextLine();
			// Print name
			printName(name);
		}
		finally
		{
			System.setIn(stdin);
		}

	}

}
```
