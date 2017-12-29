---
layout: post
title: "Reservoir sampling"
date: 2017-02-20 14:27:44 +0700
comments: true
categories: [algorithm, math]
---

I have been working with Stream processing a lot lately. Here's my usecase.

## Problem:

I have a stream of pageviews. But I don't want to process every single pageview, because then I will process one pageview over and over again.
How do I sample the data so that I process just a subset of data but with equal probability of processing each pageview.

For example, 

```
[pageview1, pageview2, pageview1, pageview3]
```

Now I want to choose 3 pageviews out of 4

## Solution:
We choose `[pageview1, pageview2, pageview1]` as the initial reservior. Then I choose pageview3 with a probability of 3/4

## Code
``` javascript
const samples = [];
const sampleSize = 10;
pageviews.forEach((record, index) => {
  if (samples.length < sampleSize) {
    samples.push(record);
  } else {
    let rand = Math.floor(Math.random() * index);
    if (rand < sampleSize) {
      samples[rand] = record;
    }
  }
});
```

I might not explain the math clearly, because I'm not very good at math. If you want to know more I recommend [this](https://gregable.com/2007/10/reservoir-sampling.html) and [this](https://jeremykun.com/2013/07/05/reservoir-sampling/) and [this](https://discuss.leetcode.com/topic/53753/brief-explanation-for-reservoir-sampling) and [this](http://austinrochford.com/posts/2014-11-30-reservoir-sampling.html). There's also my [question](https://stackoverflow.com/questions/42046581/is-sample-size-of-1-consider-reservoir-sampling/42053227?noredirect=1#comment71830111_42053227) on SO about proof.


