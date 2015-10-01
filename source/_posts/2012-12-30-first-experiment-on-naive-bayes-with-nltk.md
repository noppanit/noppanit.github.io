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

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="kw1">for</span> word<span class="sy0">,</span> pos_tag <span class="kw1">in</span> nltk.<span class="me1">pos_tag</span><span class="br0">&#40;</span>words<span class="br0">&#41;</span>:<br /> &nbsp; &nbsp;<span class="kw1">if</span> pos_tag <span class="sy0">==</span> <span class="st0">'ADJ'</span>:<br /> &nbsp; &nbsp; &nbsp; filtered_words.<span class="me1">append</span><span class="br0">&#40;</span>word.<span class="me1">lower</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#41;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

The second attempt I decided to fall back to bag-of-words model, and the result has gone up to **61.316872428 %**

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          filtered_words <span class="sy0">=</span> <span class="br0">&#91;</span>e.<span class="me1">lower</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="kw1">for</span> e <span class="kw1">in</span> words.<span class="me1">split</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="kw1">if</span> <span class="kw2">len</span><span class="br0">&#40;</span>e<span class="br0">&#41;</span> <span class="sy0">>=</span> <span class="nu0">3</span><span class="br0">&#93;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

So, I moved on and try to clean up the text a bit by cleaning stopwords, stripping &#8216;RT&#8217; or &#8216;rt&#8217; for retweet, deleting @peoplename and tokenise word by whitespace. So, &#8220;i&#8217;m&#8221; stays as one word and not [&#8220;i&#8221;, &#8220;&#8216;m&#8221;]. The result has gone up to **69.9588477366 %**.

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="co1"># stripping and cleaning.</span><br /> <span class="co1"># this is for stripping out the stopwords by using <a href="http://nltk.googlecode.com/svn/trunk/doc/book/ch02.html" title="NLTK Text Corpora">NLTK Text Corpora</a></span><br /> stripped_words <span class="sy0">=</span> <span class="br0">&#91;</span>w <span class="kw1">for</span> w <span class="kw1">in</span> tokenized_text <span class="kw1">if</span> <span class="kw1">not</span> w <span class="kw1">in</span> stopwords.<span class="me1">words</span><span class="br0">&#40;</span><span class="st0">'english'</span><span class="br0">&#41;</span><span class="br0">&#93;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

I&#8217;ll keep experimenting and post some more techniques to see if I could get something out of this.

 [1]: http://en.wikipedia.org/wiki/Plutchik%27s_Wheel_of_Emotions#Plutchik.27s_wheel_of_emotions "Plutchik wheel of emotions"
 [2]: http://www.laurentluce.com/posts/twitter-sentiment-analysis-using-python-and-nltk/ "twitter sentiment analysis"
 [3]: https://github.com/japerk/nltk-trainer "nltk trainer"
 [4]: http://en.wikipedia.org/wiki/Bag-of-words_model "bag of words model"