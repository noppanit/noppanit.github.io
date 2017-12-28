---
title: If XML file is too big for AJAX
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /if-xml-file-is-too-big-for-ajax/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/aBcfYP
wp_jd_target:
  - http://www.noppanit.com/if-xml-file-is-too-big-for-ajax/
dsq_thread_id:
  - 192615300
categories:
  - Knowledges
---
http://www.developer.com/lang/php/article.php/3897851/article.htm

I found this article which is quite useful. What will you do if XML file is too big.

1. Transform the XML documents into a character string.  
2. Split the character string into equal chunks (400 characters).  
3. Save each chunk as a value in an array.  
4. Transfer the chunks one by one using the Ajax mechanism into the final XML document.