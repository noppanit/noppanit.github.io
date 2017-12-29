---
title: 'Tutorial &#8211; My Personal Dictionary by Google Translate'
comments: true
author: Noppanit Charassinvichai
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/7bDMdf
wp_jd_target:
  - http://www.noppanit.com/tutorial-my-personal-dictionary-by-google-translate/
dsq_thread_id:
  - 187161009
categories:
  - Javascript
---
As Google provides us the AJAX support for Google translate and other very useful API to access the most powerful API from Google. I tried to play a little bit with the Google Translate to build my very simple dictionary Eng &#8211; Thai. 

Here is the code, which is very simple and straightforward.

``` html
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Dictionary Eng - Thai</title>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">
    function callBackTranslate() 
  {
    var word = document.getElementById("word").value;
      google.language.translate(word, "en", "th", function(result) {
        if (!result.error) {
          var container = document.getElementById("translation");
          container.innerHTML = result.translation;
        }
      });
    }
  
  function translate()
  {
    google.load("language", "1", {"callback" : callBackTranslate});
  }

    </script>
  </head>
  <body>
  <div>
    <input type="text" id="word" name="word"/>
  </div>
  <div>
    <input type="button" value="Translate" onclick="translate();"/>
  </div>
  <div id="translation"> </div>

  </body>
</html>
```
