---
title: 'Second sentiment analysis experiment on Naive Bayes with NLTK : Bigrams'
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

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="kw1">from</span> nltk.<span class="me1">collocations</span> <span class="kw1">import</span> *<br /> <br /> tokenized_text <span class="sy0">=</span> nltk.<span class="me1">wordpunct_tokenize</span><span class="br0">&#40;</span>words<span class="br0">&#41;</span><br /> tokenized_text <span class="sy0">=</span> <span class="br0">&#91;</span>word.<span class="me1">lower</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="kw1">for</span> word <span class="kw1">in</span> tokenized_text<span class="br0">&#93;</span><br /> <br /> finder <span class="sy0">=</span> BigramCollocationFinder.<span class="me1">from_words</span><span class="br0">&#40;</span>tokenized_text<span class="br0">&#41;</span><br /> bigrammed_words <span class="sy0">=</span> <span class="kw2">sorted</span><span class="br0">&#40;</span>finder.<span class="me1">nbest</span><span class="br0">&#40;</span>bigram_measures.<span class="me1">chi_sq</span><span class="sy0">,</span> <span class="nu0">200</span><span class="br0">&#41;</span><span class="br0">&#41;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

I decided to use **chi_sq** as suggested in [this post][2]. However, the accuracy has gone down significantly to **19.7530864198%**. I guess this might be that my document (~100 document for each sentiment) is not large enough to use bigrams. But this is just my conclusion. I&#8217;m going to try to increase the dataset and test it again.

 [1]: http://www.noppanit.com/first-experiment-on-naive-bayes-with-nltk/ "first experiment on naive bayes with sentiment analysis"
 [2]: http://streamhacker.com/tag/bigrams/ "stream hacker bigrams"