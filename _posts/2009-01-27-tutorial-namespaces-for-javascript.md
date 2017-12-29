---
title: 'Tutorial : Namespaces for javascript'
comments: true
author: Noppanit Charassinvichai
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/4A3AQW
wp_jd_target:
  - http://www.noppanit.com/tutorial-namespaces-for-javascript/
dsq_thread_id:
  - 289589990
categories:
  - Javascript
---
Have you ever had a problem using somebody method with the same name. Well, Have you ever thought why javascript don&#8217;t have package or namespaces like other languages. Well, change your mind. This is how you will be implementing namespaces for javascript.

``` javascript
if ( com == null || typeof( com ) != "object" ) {
	var com = new Object();
}

if ( com.noppanit == null || typeof( com.noppanit ) != "object" ) {
	com.noppanit = new Object(); 
}

com.noppanit = { 
	message : function() 
  	{ 
    		alert('test'); 
  	}, 
  	message1 : function() 
  	{ 
    		alert('test1'); 
  	} 
}; 

com.noppanit.message(); 
com.noppanit.message1(); 
```
