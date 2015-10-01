---
title: My Library
author: Noppanit Charassinvichai
layout: post
permalink: /my-library/
dsq_thread_id:
  - 1667976952
categories:
  - Java
tags:
  - lucene
  - search engine
---
Nowadays, we are swamped with information. For instance, I have lots of E-Books that have been written on plenty of CDs or DVDs, and they haven&#8217;t been read at all because they are on DVD. Moreover, I don&#8217;t even know where they are or which DVD is the right one for me. So, that&#8217;s why I came up with an idea that why don&#8217;t we do something. I found some software that can solve this problem, such as Google Desktop. But that software is not what I wanted, because I need something smaller.

When I was working with the old company, I had a chance to know <a href="http://lucene.apache.org/" target="_blank">Lucene</a>. This project is under Apache, so it is reliable. This project, briefly, is full-text search engine, like Google. But it is written in JAVA and other platforms as well. Documents will be indexed and searched through Lucene engine.

Here&#8217;s my plan.

So, I am creating an web application. The input for this application is folder that contains files, such as PDFs and CHMs or any other documents that user wants to index. The application will index though those files and use filename as a keyword with a description field that I created. Those files will be searched by filename or description. This is just my idea!!. Personally, I am using the description field as DVD name. Hence, when I search by filename or description, the application will tell me where are the files I&#8217;m looking for and which DVD that they are kept.

The advantage of this application is an offline search. If user uses files or folders searching on window. The files have to be actually on Hard Driver. On the other hand, the application collects just filename and description and write into index files. So, when we search, we search through the index files.