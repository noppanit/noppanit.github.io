---
layout: post
title: "Why algorithm matters?"
date: 2015-10-08 15:55:29 -0400
comments: true
categories: 

 - performance
---

If you have been to one of those technical interviews, you will like this. 

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so fuck off.</p>&mdash; Max Howell (@mxcl) <a href="https://twitter.com/mxcl/status/608682016205344768">June 10, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I'm not going to rant about how broken the technical interviews are. There's enough people who are more qualified to rant about this more than me. 

So, why this matters? I just want to give a quick example of why algorithm matters. Please no haters! I know some of you might read this and will say "I do that all the time, what's the big deal". I'm still a bad developer and I'm still learning.

## Scenario

You are a general, your home country is at war and you have to fight for your country. You are given a group of soldiers. You want to come up with a strategy to win the battle. Here's the example of the soldiers.

```

[
    {
        "category": "machine-gun",
        "id": 0,
        "name": "D408CF"
    },
    {
        "category": "machine-gun",
        "id": 1,
        "name": "C0BAD7"
    },
    {
        "category": "rocket-man",
        "id": 2,
        "name": "04B5E4"
    },
    {
        "category": "rocket-man",
        "id": 3,
        "name": "22F3CF"
    },
    {
        "category": "machine-gun",
        "id": 4,
        "name": "811E8A"
    }
    ,
    ...
]

```

You came out of a high-profile meeting and all the generals agree that this formation will be best to fight the enemy; *infantry*, *machine-gun* and *rocket-man*. How can I rearrange this quick enough because we're going to attack tomorrow? Simple I go ahead and write the code.

First, let's generate a bunch of soldiers

``` python

class Soldier(object):
    def __init__(self, id, name, category):
        self.id = id
        self.name = name
        self.category = category

number_of_soldier = 10000

soldiers = []
for i in range(0, number_of_soldier):
    name = str(uuid.uuid4().get_hex().upper()[0:6])
    soldiers.append(Soldier(i, name, random.choice(categories)))

```

Then let's rearrange them.

``` python

import json
import uuid
import random
import time

categories = ['infantry', 'machine-gun', 'rocket-man']

start = time.time()
result = []
for c in categories:
    s_list = []
    for s in soldiers:
        if s.category == c:
            s_list.append(s)

    result.extend(s_list)
    s_list = []

end = time.time()
print(end - start)

```

It works, but you're too late you can't form the soldiers in time. If you take a closer look, this algorithm takes *O(n*m)* for the time complexity given the number of soldiers is *n* and the *category* is *m*. If you have a million soldiers and a million categories you would get *O(n^2)*. How can we make this one faster?

Here's my second version. Hmm, rearrange into category... category is bucket. How about using map? 

``` python

from collections import defaultdict

start = time.time()
map_of_soldiers = defaultdict(list)
 
for s in soldiers:
    map_of_soldiers[s.category].append(s)

result = []
for c in categories:
    result.extend(map_of_soldiers.get(c))

end = time.time()
print(end - start)

```

This is the time difference of those two algorithms.

```

0.00743103027344
0.00331783294678

```

By just changing the data structure, you can see that the *map* version is almost twice as fast. I hope I can demostrate how choosing the right algorithm matters in your program. 


