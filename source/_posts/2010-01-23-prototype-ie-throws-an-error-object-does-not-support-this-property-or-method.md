---
title: 'Prototype : IE throws an error: &#8220;Object does not support this property or method&#8221;.'
author: Noppanit Charassinvichai
layout: post
permalink: /prototype-ie-throws-an-error-object-does-not-support-this-property-or-method/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/4u3XKn
wp_jd_target:
  - http://www.noppanit.com/prototype-ie-throws-an-error-object-does-not-support-this-property-or-method/
dsq_thread_id:
  - 192587306
categories:
  - Javascript
---
I have been this problem for ages. How stupid am I? To resolve this problem just parse the element to $(element) before use. That&#8217;s it. The problem is IE doesn&#8217;t allow you to extend element.

Reference : <http://proto-scripty.wikidot.com/faq#propnotsupported>