---
title: 'Example: How did I convert async code to sync code with Promise.'
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 3789211664
categories:
  - Javascript
tags:
  - javascript
  - node.js
  - promise
---
I&#8217;ve just finished my first refactor to convert my node.js code to be more promisey (I believe that&#8217;s the word they use these days). There&#8217;s lots of documents out there to do this. However, I thought I should contribute more to help me understand more and might get some feedback from people who&#8217;s seen it as well.

I&#8217;m trying to create a bot to report me back the performance of my site in desktop and mobile mode. So, I thought it would be easy since Google has an [API][1] for that already so I went ahead and did this.

``` javascript

var request = require('request');
var urlToGetTheScore = 'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy=desktop&amp;fields=ruleGroups'

request.get(urlToGetTheScore, function (error, response, body) {
  if(error) console.log(error);
  
  console.log(JSON.parse(body).ruleGroups.SPEED.score);
});

```

It&#8217;s pretty easy and straight forward right but now that would only return the score of desktop. I need the score of my mobile site as well. So, I added more code to be like this.

``` javascript

var request = require('request');

var urlToGetTheScoreDesktop = 'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy=desktop&amp;fields=ruleGroups'

var urlToGetTheScoreMobile = 'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy=mobile&amp;fields=ruleGroups'

request.get(urlToGetTheScoreDesktop, function (error, response, body) {
  if(error) console.log(error);

  console.log(JSON.parse(body).ruleGroups.SPEED.score);
});

request.get(urlToGetTheScoreMobile, function (error, response, body) {
  if(error) console.log(error);

  console.log(JSON.parse(body).ruleGroups.SPEED.score);
});

```

That&#8217;s great but I want to return both scores to a client so I can report the scores rather than printing them to the console. Since, **request** is asynchronous you cannot guarantee which score would come first. So, I thought it&#8217;s easy. I just need to call one request after the other. So, I came up with this.

``` javascript

var request = require('request');

var urlToGetTheScoreDesktop = 'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy=desktop&amp;fields=ruleGroups'

var urlToGetTheScoreMobile = 'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy=mobile&amp;fields=ruleGroups'

request.get(urlToGetTheScoreDesktop, function (error, response, body) {
  if(error) reject(error);

  var desktopScore = JSON.parse(body).ruleGroups.SPEED.score;

  request.get(urlToGetTheScoreMobile, function (error, response, body) {
    if(error) reject(error);

    var mobileScore = JSON.parse(body).ruleGroups.SPEED.score;

    console.log('desktop score is ' + desktopScore + ' and mobile score is ' + mobileScore);
  });
});

```

Look at how ugly it is. Now I want to make it prettier. So, I will use Promise to make it look nicer. As a good engineer I need to create a test first.

``` javascript

var perfModule = require('./pagespeed'),
sinon = require('sinon'),
request = require('request'),
expect = require('expect.js');

describe('Performance', function() {
var server;
  beforeEach(function(done) {
    sinon.stub(request, 'get').yields(null, null, JSON.stringify({ruleGroups : { SPEED: {score:10}} }));
    done();
  });
  
  it('should send performance stats to chat room', function(done) {
    perfModule.pagespeed(function(donotknow, msg) {
      done();
      expect(msg).to.eql('desktop speed is 10 and mobile speed is 10');
    });
  });
});

```

I&#8217;m using [Sinon.js][2] as the mocking framework and [Mocha][3] as the testing framework which are pretty standard.

Now I can start refactor my code. At first, I wrote some code like this, just to make it work.

``` javascript

var request = require('request');

var getSpeed = function(strategy) {
  var url = 'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy='+ strategy + '&amp;fields=ruleGroups'
  return new Promise(function(resolve, reject) {
    request.get(url, function (error, response, body) {
      if(error) reject(error);

      console.log(body);
      resolve(JSON.parse(body).ruleGroups.SPEED.score);
    });
  });
};

var pagespeed = function(cb) {
  getSpeed('desktop').then(function(desktopSpeed) {
    getSpeed('mobile').then(function(mobileSpeed) {
      console.log('desktop speed is ' + desktopSpeed + ' and mobile speed is ' + mobileSpeed);
    });

  });
};

exports.pagespeed = pagespeed;

```

Any good JavaScript developer would be like, WTH!. You still have callbacks. I thought Promise would solve that issue already! Now, I could use the power of **Promise.all** which takes array of promises and return array of results. My final code would look something like this.

``` javascript

var request = require('request'),
Promise = require('promise');

var getSpeed = function(strategy) {
  var url = 'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http%3A%2F%2Ffusion.net&amp;strategy='+ strategy + '&amp;fields=ruleGroups'
  return new Promise(function(resolve, reject) {
    request.get(url, function (error, response, body) {
      if(error) reject(error);

      console.log(body);
      resolve(JSON.parse(body).ruleGroups.SPEED.score);
    });
  });
};

var pagespeed = function(cb) {
  Promise.all([getSpeed('desktop'), getSpeed('mobile')]).then(function(speed) {
    var desktop = speed[0];
    var mobile = speed[1];

    console.log(null, 'desktop speed is ' + desktop + ' and mobile speed is ' + mobile);
  }).catch(function(error) {
    console.log(error);
  });
};

exports.pagespeed = pagespeed;

```

I&#8217;m not an expert in Promise and I welcome any feedback that would help improve my code.

Reference  
[ES6 Promises][4]  
[We have a problem with promises][5]

 [1]: https://developers.google.com/speed/docs/insights/v2/getting-started
 [2]: http://sinonjs.org/
 [3]: http://mochajs.org/
 [4]: http://www.html5rocks.com/en/tutorials/es6/promises/
 [5]: http://pouchdb.com/2015/05/18/we-have-a-problem-with-promises.html
