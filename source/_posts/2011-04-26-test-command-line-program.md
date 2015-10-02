---
title: Test Command Line Program
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /test-command-line-program/
dsq_thread_id:
  - 288650214
categories:
  - Java
---
When I was in TWU I was assigned to implement a simple program in Java Command line. I was ok but when I came to TDD approach I really didn&#8217;t know what to do and test command-line in JUnit. I googled but I found nothing. However, after [Mark Needham][1] shows us in code and it was rather easy to do that. So I think I would write the example so that I could remember. 

If you have a program like this. How would you test it in JUnit?

``` java
public void launchApp() throws IOException {
	InputStreamReader inputStream = new InputStreamReader(System.in);
	BufferedReader reader = new BufferedReader(inputStream);
	String value = reader.readLine();
	int choice = Integer.parseInt(value);
	switch( choice )
	{
		case 0:
			System.out.println("Print 0");
			break;
		case 1:
			System.out.println("Print 1");
			break;
		case 2:
			int anotherChoice = Integer.parseInt(reader.readLine());
			if( anotherChoice == 0 )
			{
				System.out.println("Print Toy");
			}
			else
			{
				System.out.println("Print Something Else");
			}
			break;
	}
}
```

What he pointed out to test this kind of program is to implement a queue in InputStreamReader.

This is the example

``` java
class StubbedInputStream extends InputStream {
	private Queue<String> input;

	public StubbedInputStream(Queue<String> input) {
		this.input = input;
	}

	@Override
		public int read(byte[] bytes) throws IOException {
			return super.read(bytes);    //To change body of overridden methods use File | Settings | File Templates.
		}

	@Override
		public int read(byte[] bytes, int i, int i1) throws IOException {
			if(input.isEmpty()) {
				return -1;
			}

			int byteLocation = 0;
			for(byte b : input.remove().getBytes()) {
				bytes[byteLocation] = b;
				byteLocation++;
			}
			bytes[byteLocation] = "\n".getBytes()[0];
			return byteLocation + 1;
		}

	@Override
		public int read() throws IOException {
			return 0;
		}

	public static InputStreamBuilder stubInputStream() {
		return new InputStreamBuilder();
	}
}
```

And &#8230;

``` java
public class InputStreamBuilder {
	private Queue<String> values = new LinkedList<String>();

	public InputStreamBuilder toReturn(String value) {
		this.values.add(value);
		return this;
	}

	public InputStreamBuilder then(String value) {
		this.values.add(value);
		return this;
	}

	public StubbedInputStream atSomePoint() {
		return new StubbedInputStream(values);
	}
}
```

When you want to test the command-line program you can do something like this.

``` java
public class MainTest {

    private PrintStream console;
    private ByteArrayOutputStream outputStream;

    @Before
    public void before() {
        console = System.out;
        outputStream = new ByteArrayOutputStream();
    }

    @Test
    public void mainTest() throws IOException {
        System.setOut(new PrintStream(outputStream));
        System.setIn(stubInputStream().toReturn("0").atSomePoint());

        new Main().launchApp();

        assertThat(outputStream.toString(), containsString("Print 0"));
    }

    @Test
    public void mainTestNextCase() throws IOException {
        System.setOut(new PrintStream(outputStream));
        System.setIn(stubInputStream().toReturn("2").then("0").atSomePoint());

        new Main().launchApp();

        assertThat(outputStream.toString(), containsString("Print Toy"));
    }
}
```
 [1]: http://www.markhneedham.com/
