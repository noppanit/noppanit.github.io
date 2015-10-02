---
title: First experiment on Naive Bayes with NLTK
author: Noppanit Charassinvichai
layout: post
permalink: /first-experiment-on-naive-bayes-with-nltk/
dsq_thread_id:
  - 999137193
categories:
  - Python
tags:
  - navie bayes
  - NLP
  - python
---
I have been experimenting with Natural Language Processing on Text classification for a while now. So, I&#8217;m going to write a little journal on my blog. There are lots of academic papers or event commercial API on the Internet for sentiment analysis. But most of them only classify sentiment into **negative**, **positive** and **neutral**. My experiment will be based on [Plutchik&#8217;s wheel of emotions][1] which will classify a text into one of the eight emotions.

For the purpose to get things done really fast, I use the example from [Laurent&#8217;s blog][2]. But you can use [nltk-trainer][3] to train the classifier without a single line of python code. 

Most papers suggest that [bag-of-words model][4] is one of the best techniques o classify text. So, I decided to use this method. However, this is about sentiment analysis so I used only Adjectives for feature extraction. The result is unacceptable with only **19.7530864198 %**

``` python
for word, pos_tag in nltk.pos_tag(words):
   if pos_tag == 'ADJ':
      filtered_words.append(word.lower())
```

The second attempt I decided to fall back to bag-of-words model, and the result has gone up to **61.316872428 %**

``` python
filtered_words = [e.lower() for e in words.split() if len(e) >= 3]
```

So, I moved on and try to clean up the text a bit by cleaning stopwords, stripping &#8216;RT&#8217; or &#8216;rt&#8217; for retweet, deleting @peoplename and tokenise word by whitespace. So, &#8220;i&#8217;m&#8221; stays as one word and not [&#8220;i&#8221;, &#8220;&#8216;m&#8221;]. The result has gone up to **69.9588477366 %**.

``` python
# stripping and cleaning.
# this is for stripping out the stopwords by using <a href="http://nltk.googlecode.com/svn/trunk/doc/book/ch02.html" title="NLTK Text Corpora">NLTK Text Corpora</a>
stripped_words = [w for w in tokenized_text if not w in stopwords.words('english')]
```

I&#8217;ll keep experimenting and post some more techniques to see if I could get something out of this.

 [1]: http://en.wikipedia.org/wiki/Plutchik%27s_Wheel_of_Emotions#Plutchik.27s_wheel_of_emotions "Plutchik wheel of emotions"
 [2]: http://www.laurentluce.com/posts/twitter-sentiment-analysis-using-python-and-nltk/ "twitter sentiment analysis"
 [3]: https://github.com/japerk/nltk-trainer "nltk trainer"
 [4]: http://en.wikipedia.org/wiki/Bag-of-words_model "bag of words model"
