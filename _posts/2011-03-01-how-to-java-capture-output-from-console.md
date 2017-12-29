---
title: 'How to : Java capture output from console'
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 243225146
categories:
  - Java
---
Well, the topic pretty says everything. So, here's the solution.

``` java
final ByteArrayOutputStream myOut = new ByteArrayOutputStream();
System.setOut(new PrintStream(myOut));

// test stuff here...

final String standardOutput = myOut.toString();
```

The idea is just redirect the System.out to another PrintStream and you can use information in the PrintStream.
