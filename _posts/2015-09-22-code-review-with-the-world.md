---
title: Code Review with the world
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /code-review-with-the-world/
dsq_thread_id:
  - 4157005768
categories:
  - Knowledges
tags:
  - codereview
---
## TL;DR

If you don&#8217;t know [Code Review Stackoverflow][1] you gotta get on it now. It works and it&#8217;s awesome.

## Longer version

In Agile world, everybody is talking about fail fast and faster feedback. If you&#8217;re a serious coder then code review and feedback are just as important. If you&#8217;re like me (maybe I&#8217;m alone), I used to hate code review so much because I don&#8217;t want someone to criticize my work, coding is like an art. You spent a lot of time on a piece of code and somebody just come in and say it sucks or why would you do something like that?. Not everybody is a great coder like Linus Torvalds or Ryan Dahl. Especially me, Because of rigorous code review I came from the worst coder every to bad coder (I&#8217;m still bad and I&#8217;m still learning). I believe the best way to learn any skill is first you have to be wrong and learn from your mistakes. The quickest way to do that is to code a lot and get your code reviewed by someone who&#8217;s a stronger coder than you, which you will have a lot on the Internet. If you work with some of the best programmers in your life then you&#8217;re lucky. But not everybody is that fortunate. I&#8217;ve found a better solution. <http://codereview.stackexchange.com/>

## Let&#8217;s get to the meat

For example, I wrote this piece of code to learn about dynamic programming.

{% codeblock python %}
import sys
coins = [1, 3, 5]
min_coin = [sys.maxint] * 20
min_coin[] = 

for min_of_i in range(20):
    for c in coins:
        if c <= min_of_i and (min_coin[min_of_i - c] + 1 < min_coin[min_of_i]):
                min_coin[min_of_i] = min_coin[min_of_i - c] + 1
{% endcodeblock %}

I know that my code is not bad (or maybe is really bad), but let&#8217;s see what I get out of it from this [thread][2]. From within a day I have at least 2-3 points to make my code a lot better. Not only that I learn more about Python, I also learn how to optimize the script. 

If you want to learn a new language fast, you need to learn from the expert. In just a few days I improved my code substantially. The best thing about the Internet is, you will have someone to review the reviewer as well. So, you can be sure to some extent that the one who answered your question is trustworthy. 

Now you might wonder, how about <http://stackoverflow.com/>? I use Stackoverflow too but Stackoverflow has its own purpose. If you&#8217;re stuck in some problem and you can&#8217;t really wrap your head around it posting to Stackoverflow will give you answer in no time. However, if you ask somebody on Stackoverflow to review your code, it&#8217;s likely that your thread will be voted down or closed.

## What about if you only have an idea.

I always have new idea and somehow I want experts to review or confirm my idea so I don&#8217;t waste time building something that somebody has done it before. Then, Stackoverflow or codereview.stackoverflow.com is not really the place you&#8217;d go for. That&#8217;s what I love about [Quora.com][3].

For example, I wanted to understand more about machine learning and I couldn&#8217;t really ask on [stats.stackexchange.com][4]. That&#8217;s why I turned to Quora. For example, this [thread][5], I got a really detailed response from whom I can trust because of the number of upvotes.

## Some note

I have one bad habit of just copying and pasting someone else&#8217;s code. Once you received the feedback, don&#8217;t just copy and paste that. Or if you get feedback from Github don&#8217;t just merge that right away. You will not fully understand the concept behind that. In the book I read recently, [A Mind For Numbers][6], Barbara taught us about how we can master in math and science and she explains that we have two modes of learning, focused and diffuse mode. If you just copy and paste someone else&#8217;s work, then you just imagine that you understand what&#8217;s going on. The best way to learn that is to actually do it and go into diffuse mode which is just close your eyes and think about it and go back to focused mode to do that again. I made a big mistake as an Engineer (I still do) that I just copy someone else&#8217;s code and I think that I understand that fully which I don&#8217;t. So, don&#8217;t just copy the feedback and commit that make sure you fully understand the code and actually type it. Barbara also suggested that writing is better than just typing but I think it might be difficult for us programmers.

 [1]: http://codereview.stackexchange.com/
 [2]: http://codereview.stackexchange.com/questions/92811/find-the-minimum-number-of-coins
 [3]: http://Quora.com
 [4]: http://stats.stackexchange.com
 [5]: https://www.quora.com/How-do-I-start-if-I-want-to-build-a-model-to-predict-if-a-tweet-will-go-viral/answer/Shankar-Iyer-5?__snids__=1350032536&__nsrc__=2
 [6]: http://www.amazon.com/o/ASIN/039916524X/sciencefriday/
