---
title: 'Second sentiment analysis experiment on Naive Bayes with NLTK : Bigrams'
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /second-sentiment-analysis-experiment-on-naive-bayes-with-nltk-bigrams/
dsq_thread_id:
  - 999940855
categories:
  - Python
tags:
  - bigrams
  - naive bayes
  - python
---
From my [last post][1] I experimented with some of the techniques such as stopwords and bag-of-words model. I yielded some acceptable results. This post, I&#8217;m going to try with bigrams to see if I can increase the accuracy. 

I changed the code a little bit to be

``` python
from nltk.collocations import *

tokenized_text = nltk.wordpunct_tokenize(words)
tokenized_text = [word.lower() for word in tokenized_text]

finder = BigramCollocationFinder.from_words(tokenized_text)
bigrammed_words = sorted(finder.nbest(bigram_measures.chi_sq, 200))

```

I decided to use **chi_sq** as suggested in [this post][2]. However, the accuracy has gone down significantly to **19.7530864198%**. I guess this might be that my document (~100 document for each sentiment) is not large enough to use bigrams. But this is just my conclusion. I&#8217;m going to try to increase the dataset and test it again.

 [1]: https://www.noppanit.com/first-experiment-on-naive-bayes-with-nltk/ "first experiment on naive bayes with sentiment analysis"
 [2]: http://streamhacker.com/tag/bigrams/ "stream hacker bigrams"
