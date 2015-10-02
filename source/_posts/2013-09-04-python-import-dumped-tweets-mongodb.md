---
title: Python to import your dumped tweets to MongoDb
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /python-import-dumped-tweets-mongodb/
dsq_thread_id:
  - 1707250802
categories:
  - Python
---
I&#8217;m playing around with my tweets. Just so you&#8217;re aware that you could download your entire tweets and play around with it. The format is JSON so I think it makes perfect sense to dump this to MongoDB. But you can&#8217;t just import that straight away it needs some manipulation. I&#8217;m not good at Python so the code here might be tedious for python dudes. I&#8217;m going to use this data in my analysis, which will be captured in the next blog post.

``` python
import pymongo
from pprint import pprint

path = './data'
client = pymongo.MongoClient('localhost', 27017)
db = client.tweets
def main():
        for infile in glob.glob( os.path.join(path, "*.js")):
                content = open(infile).read()
                indexOfFirstEqualSign = content.find("=") + 1
                pureJson = content[indexOfFirstEqualSign:]
                jsonifedData = json.loads(pureJson)
                db.tweets_collection.insert(jsonifedData)

if __name__ == "__main__":
        main()
```

The data is kept in **data** folder.
