---
title: Rise of the (Slack)Bots.
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /rise-of-the-slackbots/
dsq_thread_id:
  - 3788776952
categories:
  - Knowledges
tags:
  - bot
  - slack
  - superscript
---
[Fusion][1] tech team just had a hackday in the theme of &#8220;Slackbot&#8221;. We brainstormed what or how do we make the job of editorial or engineering team easier. We threw a bunch of ideas and my team decided to create a bot that can interact with you in a number of ways or encourage you to fix or debug code. We tried to make it funny and in the same time useful for our daily routine.

My colleague [Daniel Bachhuber][2] came up with the name Rubberduck which I believe he got it from [here][3]. The idea of the bot is easy. If you have used Slack you must have seen Slackbot before where it guides you how to use Slack or the bot can help you change your profile picture.

We spent a good one hour to find the best possible solution for creating a bot and we found [Superscript][4], which has a client for Slack. It&#8217;s perfect!.

We&#8217;ve also opensourced the [bot][5] which you can clone and play around with it as well.

The first plugin we are thinking is performance bot where the bot can report the current performance of a website instead of going to a dashboard. It&#8217;s because we have remote team. So, having a bit giant board wouldn&#8217;t make much sense since some of our folks are distributed and we mainly use Slack for any communication.

<img class=" size-full wp-image-1403" src="http://www.noppanit.com/wp-content/uploads/2015/05/Screenshot-2015-05-23-19.42.23.png" alt="rubberduck bot" width="501" height="86" />

Now, go ahead and create your own bot!.

&nbsp;

Check this out. [Rise of the bots][6]

 [1]: http://fusion.net
 [2]: https://twitter.com/danielbachhuber
 [3]: http://en.wikipedia.org/wiki/Rubber_duck_debugging
 [4]: https://github.com/silentrob/superscript/
 [5]: https://github.com/fusioneng/rubberduck-bot
 [6]: https://medium.com/@rob_ellis/slack-superscript-rise-of-the-bots-bba8506a043c