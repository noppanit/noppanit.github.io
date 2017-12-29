---
title: "Lower your Redis memory footprint by a few lines of code"
date: 2017-04-18 14:48:38 -0400
comments: true
categories: [performance, javascript]
---

If you have Redis as your cache for your application you might want to lower your memory footprint by compressing your data. This will save you at least 50% of your memory usage for your Redis which will save you money. 

The code sample is for node.js but the concept work for any language.

``` javascript

const zlib = require('zlib');
const redis = require('redis');
const Promise = require('bluebird');

Promise.promisifyAll(redis.RedisClient.prototype);
Promise.promisifyAll(redis.Multi.prototype);

function set(key, value, expiration) {
  const expire = expiration || config.redis.expirationInSeconds;
  return zipAsync(Buffer.from(value)).then((compressed) => {
    return compressed.toString('base64');
  }).then((compressed) => {
    return redisClient.setexAsync(key, expire, compressed);
  })
}

function get(key) {
  return redisClient.getAsync(key).then((cachedResponse) => {
    if (!cachedResponse) {
      return null;
    }
    return gunzipAsync(Buffer.from(cachedResponse, 'base64')).catch(() => {
      // Just in case if any cache is not compressed
      return cachedResponse;
    });
  }).then(response => {
    return response ? response.toString() : response;
  });
}

```

You don't need to use Bluebird if you don't want to. 

Now the problem is I can't just go in to my Redis and `Get ${key}` I want because it won't be readable. You can just do this.

``` bash
redis-cli -h 127.0.0.1 GET "${YOUR_KEY}" | base64 -D | gzip -d | jq
```

I use `jq` because I `JSON.stringify` my value

We lower our cache node from 16GB to just 3GB.
