---
title: Merge documents from two collections together in MongoDb
author: Noppanit Charassinvichai
layout: post
permalink: /merge-documents-two-collections-together-mongodb/
dsq_thread_id:
  - 2167431749
categories:
  - Knowledges
tags:
  - map
  - mongodb
  - reduce
---
The problem is I have a lot of documents in one collection and even a lot more documents in another collection. I want to merge those documents together but I don&#8217;t want to write a lot of code to merge those documents together. It also might take a lot of time to do it. 

MongoDb comes with [map/reduce][1] which is a cool feature you can use to achieve something like this. If you don&#8217;t know what map/reduce is I wrote an [article][2] like this sometime ago.

Let&#8217;s say you have one collection with this document. Let&#8217;s say it&#8217;s **products** collection.</p> 

``` json
{
  "_id" : ObjectId("52e05133c68f0b2a95e2b67b"),
  "product_id" : 1,
  "title" : "Sharpie"
}
```

And another document in **prices** collection.

``` json
{
  "_id" : ObjectId("52e05473c68f0b2a95e2b682"),
  "product_id" : 1,
  "price" : 99
}
```

I want to end up with this.

``` json
{ "_id" : 1, "value" : { "title" : "Sharpie", "price" : 99 } }
```

Here&#8217;s what you can do. Insert your data first.

``` javascript
db.products.insert({"product_id" : 1, "title" : "Sharpie"});
db.products.insert({"product_id" : 2, "title" : "Sticky"});
db.prices.insert({"product_id" : 1, "price" : 99});
db.prices.insert({"product_id" : 2, "price" : 30});
```

Then you build maps to get key/value from the documents

``` javascript
products_map = function() {
  emit(this.product_id, {"title" : this.title});
}

prices_map = function() {
  emit(this.product_id, {"price" : this.price});
};
```

Then you build your reduce function

``` javascript
r = function(key, values) {
  var result = {
      "title" : "",
      "price" : ""
    };

    values.forEach(function(value) {
      if(value.title !== null) {result.title = value.title;}

      if(value.price !== null) {result.price = value.price;}
    });

    return result;
}
```
Then you run your map/reduce function.

``` javascript
res = db.products.mapReduce(products_map, r, {out: {reduce : 'joined'}});
res = db.prices.mapReduce(prices_map, r, {out: {reduce : 'joined'}});
```
Then you will get another collection **joined** with the information you want. One caveat is right now map/reduce function will result in **value : { &#8220;field&#8221; : &#8220;value&#8221; }**.

 [1]: http://docs.mongodb.org/manual/core/map-reduce/ "mongodb map reduce"
 [2]: http://www.noppanit.com/mapreduce-dummies/
