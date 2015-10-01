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

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          {<br /> &nbsp; "_id" : ObjectId("52e05133c68f0b2a95e2b67b"),<br /> &nbsp; "product_id" : 1,<br /> &nbsp; "title" : "Sharpie"<br /> }
        </div>
      </td>
    </tr>
  </table>
</div>

And another document in **prices** collection.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          {<br /> &nbsp; "_id" : ObjectId("52e05473c68f0b2a95e2b682"),<br /> &nbsp; "product_id" : 1,<br /> &nbsp; "price" : 99<br /> }
        </div>
      </td>
    </tr>
  </table>
</div>

I want to end up with this.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          { "_id" : 1, "value" : { "title" : "Sharpie", "price" : 99 } }
        </div>
      </td>
    </tr>
  </table>
</div>

Here&#8217;s what you can do. Insert your data first.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          db.products.insert({"product_id" : 1, "title" : "Sharpie"});<br /> db.products.insert({"product_id" : 2, "title" : "Sticky"});<br /> db.prices.insert({"product_id" : 1, "price" : 99});<br /> db.prices.insert({"product_id" : 2, "price" : 30});
        </div>
      </td>
    </tr>
  </table>
</div>

Then you build maps to get key/value from the documents

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          products_map = function() {<br /> &nbsp; emit(this.product_id, {"title" : this.title});<br /> }<br /> <br /> prices_map = function() {<br /> &nbsp; emit(this.product_id, {"price" : this.price});<br /> };
        </div>
      </td>
    </tr>
  </table>
</div>

Then you build your reduce function

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          r = function(key, values) {<br /> &nbsp; var result = {<br /> &nbsp; &nbsp; &nbsp; "title" : "",<br /> &nbsp; &nbsp; &nbsp; "price" : ""<br /> &nbsp; &nbsp; };<br /> <br /> &nbsp; &nbsp; values.forEach(function(value) {<br /> &nbsp; &nbsp; &nbsp; if(value.title !== null) {result.title = value.title;}<br /> <br /> &nbsp; &nbsp; &nbsp; if(value.price !== null) {result.price = value.price;}<br /> &nbsp; &nbsp; });<br /> <br /> &nbsp; &nbsp; return result;<br /> }
        </div>
      </td>
    </tr>
  </table>
</div>

Then you run your map/reduce function.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          res = db.products.mapReduce(products_map, r, {out: {reduce : 'joined'}});<br /> res = db.prices.mapReduce(prices_map, r, {out: {reduce : 'joined'}});
        </div>
      </td>
    </tr>
  </table>
</div>

Then you will get another collection **joined** with the information you want. One caveat is right now map/reduce function will result in **value : { &#8220;field&#8221; : &#8220;value&#8221; }**.

 [1]: http://docs.mongodb.org/manual/core/map-reduce/ "mongodb map reduce"
 [2]: http://www.noppanit.com/mapreduce-dummies/