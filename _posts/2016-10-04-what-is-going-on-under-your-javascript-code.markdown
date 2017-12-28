---
layout: post
title: "What is going on under your JavaScript code"
date: 2016-10-04 12:41:25 +0700
comments: true
categories: [javascript, v8, assembly]
---

**Disclaimer**

I'm no expert in this field nor having a PhD in Compiler. This is just my pure curiosity and I hope to share of what I've discovered so people can continue their curiosity.

## Why I'm interested in this. 
I was asked once during my technical interview, "What happen when you execute fs.readFileSync('')". What he meant was that how JavaScript code interacts with the machine under the hood. At the time, I thought I just wrote that code and there you go I got the content of the file. 

I couldn't answer and I didn't get the job. I just recently became a JavaScript developer because of my interest in front-end and back-end in the same time. Knowing JavaScript allows me to get the best of both worlds. However, the only thing I know about JavaScript is that it's something to do with V8 and I had no idea what's going on under the hood. So, I took the time to really understand how JavaScript works and the history behind it. So, I started with the task a computer does best; executing commands or how does a computer execute a command.

## How does computer works?
One of the best movies for me is "The Core" where "Rat" had to hack the Internet to control the flow of information. The hacker claims that he only knew one language, "zeros and ones". At the time, I understood that it's something to do with binary number, and I thought that it's just hollywood talk and these people didn't know what they were talking. I have to write `print('Hello');` to print `Hello` on my console, it has nothing to do with zeros or ones.

So, I started digging and I found [this](https://m.reddit.com/r/learnprogramming/comments/1pv40y/for_those_of_you_wondering_how_code_becomes_ones/).

Basically, when we execute a piece of code, the compiler compiles the code to a set of instructions which is Assembly. Then, we have an [assembler](https://en.wikipedia.org/wiki/Assembly_language#Assembler) to translate the instructions to their numerical equivalents. For example,

``` bash
ADD esp, 8
```

is translated in x86 architecture like this.

``` bash
Raw Hex (zero bytes in bold):

83C408   

String Literal:

"\x83\xC4\x08"

Array Literal:

{ 0x83, 0xC4, 0x08 }

Disassembly:
0:  83 c4 08                add    esp,0x8

```

Notice the HEX code `83C408` which you can translate to binary number later for the computer to understand.

You can use this [online assembler](https://defuse.ca/online-x86-assembler.htm) to play with it. 

## How does JavaScript engine (v8) work?
In a nutshell, V8 [translates JavaScript](http://thibaultlaurens.github.io/javascript/2013/04/29/how-the-v8-engine-works/)
code to machine code with *JIT (Just-In-Time) compiler*.

There are [four main stages](http://www.mattzeunert.com/2015/08/19/viewing-assembly-code-generated-by-v8.html) of how the code passes through V8.

1. JavaScript - Your code

2. Hydrogen - Intermediate code

3. Lithium - Machine specific code

4. Machine Code - This is what your computer understand.

In this post we're going to see the assembly code which is the machine specific code.

## Show me the code
Enough talking. Now show me the code you say. Let's say you have a simple function to add two numbers together like this.

``` javascript
function add(a, b) {
  return a + b;
}
```

To view the machine code in Assembly you need to install V8. First you need to install [depot-tools](https://www.chromium.org/developers/how-tos/install-depot-tools). Once you install `depot-tools` you can run
Follow this [instruction](https://github.com/v8/v8/wiki/Using%20Git).

*Note*: The documentation of how to install V8 is subject to change. So, please refer to [link](https://github.com/v8/v8/wiki/Building%20with%20GN).

In order to get `V8` you need to run. You will also need `Python 2`

``` bash
fetch v8
cd v8
```

The script will take sometime to finish. It will fetch V8 source code. Then you need to build all the dependencies by running.

``` bash
gclient sync
```

Now you need to install D8. The next step is going to take a long time. So, get yourself a nice cup of coffee.

``` bash
make x64.release objectprint=on disassembler=on
```

Once everything is in place, you're ready to see how your code is communicating with your CPU.

You can do this to get the assembly code

``` bash
cd out/x64.release
./d8 --print-code ~/Downloads/add.js
```

This is what you're likely going to see.

``` nasm
--- Raw source ---
function add(a,b) {
  return a+b;
}


--- Code ---
source_position = 0
kind = FUNCTION
compiler = full-codegen
Instructions (size = 140)
0x27f3928043e0     0  55             push rbp
0x27f3928043e1     1  4889e5         REX.W movq rbp,rsp
0x27f3928043e4     4  56             push rsi
0x27f3928043e5     5  57             push rdi
0x27f3928043e6     6  488b4f2f       REX.W movq rcx,[rdi+0x2f]
0x27f3928043ea    10  488b490f       REX.W movq rcx,[rcx+0xf]
0x27f3928043ee    14  83411b01       addl [rcx+0x1b],0x1
0x27f3928043f2    18  49ba81bb8a39e52a0000 REX.W movq r10,0x2ae5398abb81    ;; object: 0x2ae5398abb81 <FixedArray[2]>
0x27f3928043fc    28  4152           push r10
0x27f3928043fe    30  6a00           push 0x0
0x27f392804400    32  488b45f0       REX.W movq rax,[rbp-0x10]
0x27f392804404    36  488b402f       REX.W movq rax,[rax+0x2f]
0x27f392804408    40  488b400f       REX.W movq rax,[rax+0xf]
0x27f39280440c    44  50             push rax
0x27f39280440d    45  b803000000     movl rax,0x3
0x27f392804412    50  48bb80753e1001000000 REX.W movq rbx,0x1103e7580
0x27f39280441c    60  e81fffefff     call 0x27f392704340     ;; code: STUB, CEntryStub, minor: 8
0x27f392804421    65  493ba5200c0000 REX.W cmpq rsp,[r13+0xc20]
0x27f392804428    72  7305           jnc 79  (0x27f39280442f)
0x27f39280442a    74  e811e6f4ff     call StackCheck  (0x27f392752a40)    ;; code: BUILTIN
0x27f39280442f    79  498b45a0       REX.W movq rax,[r13-0x60]
0x27f392804433    83  48bba9ba8a39e52a0000 REX.W movq rbx,0x2ae5398abaa9    ;; object: 0x2ae5398abaa9 Cell for 6144
0x27f39280443d    93  83430bd1       addl [rbx+0xb],0xd1
0x27f392804441    97  791f           jns 130  (0x27f392804462)
0x27f392804443    99  50             push rax
0x27f392804444   100  e877e5f4ff     call InterruptCheck  (0x27f3927529c0)    ;; code: BUILTIN
0x27f392804449   105  58             pop rax
0x27f39280444a   106  48bba9ba8a39e52a0000 REX.W movq rbx,0x2ae5398abaa9    ;; object: 0x2ae5398abaa9 Cell for 6144
0x27f392804454   116  49ba0000000000180000 REX.W movq r10,0x180000000000
0x27f39280445e   126  4c895307       REX.W movq [rbx+0x7],r10
0x27f392804462   130  c9             leavel
0x27f392804463   131  c20800         ret 0x8
0x27f392804466   134  6690           nop

Source positions:
 pc offset  position
         0         0
       130        35  statement

Deoptimization Output Data (deopt points = 0)

Back edges (size = 0)
ast_id  pc_offset  loop_depth

0x2ae5398abbb9: [TypeFeedbackInfo]
 - ic_total_count: 0, ic_with_type_info_count: 0, ic_generic_count: 0

RelocInfo (size = 6)
0x27f3928043f4  embedded object  (0x2ae5398abb81 <FixedArray[2]>)
0x27f39280441d  code target (STUB)  (0x27f392704340)
0x27f39280442b  code target (BUILTIN)  (0x27f392752a40)
0x27f392804435  embedded object  (0x2ae5398abaa9 Cell for 6144)
0x27f392804445  code target (BUILTIN)  (0x27f3927529c0)
0x27f39280444c  embedded object  (0x2ae5398abaa9 Cell for 6144)

--- End code ---

```

~~Now, in theory you can grab the hex code and run that in C and you should be able to get the same result. I haven't tried it please let me know if it works or not.~~ It wouldn't work because the generated code has fixed memory address from when the program was executed.

What I learn from this post is how is my JavaScript code executed in my computer and the next time I got asked, I will be able to answer that interview question. Sometimes, it's nicer to be asked a question like this than how to revert a binary tree on a whiteboard. Don't you think? 

More info

1. [V8 Cheatsheet](https://gist.github.com/kevincennis/0cd2138c78a07412ef21)

2. [What does V8 do with that loop](https://wingolog.org/archives/2011/06/08/what-does-v8-do-with-that-loop)

3. [Comparing C to machine language (video)](https://www.youtube.com/watch?v=yOyaJXpAYZQ)

4. [A closer look at crankshaft v8s optimizing compiler](https://wingolog.org/archives/2011/08/02/a-closer-look-at-crankshaft-v8s-optimizing-compiler)
