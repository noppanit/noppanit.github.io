---
title: How to index all wikipedia (English) data using Elasticsearch?
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 1204484320
categories:
  - Knowledges
tags:
  - big-data
  - elasticsearch
---
I have been researching on how to get a context out of a piece of text. There are lots of techniques to do that, Information Retriever, Noun Chunker, Text Classification and etc. One technique that I have been trying to do but it&#8217;s quite difficult because of the resources and cannot be done on-the-fly is from wikipedia. Wikipedia is like a central repository where human being can contribute to add more content for other people. So, every article is written by human with some potential keywords in the text. For example, if the article is about dog, it&#8217;s likely that in the text contains word &#8220;dog&#8221; or other synonyms. However, by just indexing all the wikipedia data is not quite enough, because that means you can only search through the content which Google or Bing is doing a better job obviously. What I&#8217;m interested in [Elasticsearch][1] is [Cosine Similarity][2] which roughly speaking is a technique to determine how similar between two vectors. Elasticsearch provide just that which is [&#8220;More like this&#8221;][3] functionality. More like this technique in elasticsearch is a way you can easily measure how similar two pieces of content is. The usage is easy, just index all the text you want it to be searchable and input another piece of text then elasticsearch will give you a score.

Instead of doing everything yourself, Elasticsearch has a plugin called [elasticsearch-river-wikipedia][4] which will do everything for you from downloading all the dumped wiki data to index all the data for you to search immediately. However, I found little documentation for this one on how to use this for a Elasticsearch virgin like me. 

So, here&#8217;s how I do it. 

First of course you need to install elasticsearch. If you&#8217;re on a Mac, I suggest you to use Homebrew. 

Then you need to install the plugin by following [these steps][5]. And that should be it. However, I have looked at the plugin sourcecode and it will download the 30GB data and unzip it and index it for you in the background. There&#8217;s not logs or any indication. I find it quite hard to see when it&#8217;s finished. I actually had to listen to my CPU fan to stop then I realised that it&#8217;s done indexing. But here&#8217;s what I did to make it slightly faster and more obvious. 

The downloading takes a while depends on your connection. So, I suggest you to download the file [yourself][6] and then unzip it. Then use this command to create index.

``` bash
curl -XPUT localhost:9203/_river/wikipedia/_meta -d '
{
    "type" : "wikipedia",
    "wikipedia" : {
        "url" : "file:///${PATH_TO_YOUR_FOLDER}/enwiki-latest-pages-articles.xml"
    }
}
'
```

This will speed up the process a lot and it will reduce the chance that your JVM will face PERMGen exception because the plugin will try to unzip the 30GB data for you as well. Then just wait for the indexing to finish. You can try to see the status of your node from your browser by typing this http://localhost:9200/_stats in your favourite browser. The size of the finished index is around 40GB.

 [1]: http://www.elasticsearch.org/ "elasticsearch"
 [2]: http://en.wikipedia.org/wiki/Cosine_similarity "cosine similarity"
 [3]: http://www.elasticsearch.org/guide/reference/api/more-like-this/
 [4]: https://github.com/elasticsearch/elasticsearch-river-wikipedia "elasticsearch wikipedia"
 [5]: https://github.com/elasticsearch/elasticsearch-river-wikipedia
 [6]: http://download.wikimedia.org/enwiki/latest/enwiki-latest-pages-articles.xml.bz2 "Wiki dump"
