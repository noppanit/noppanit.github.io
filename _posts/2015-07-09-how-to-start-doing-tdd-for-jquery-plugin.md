---
title: How to start doing TDD for jQuery plugin.
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 3917701396
categories:
  - Knowledges
tags:
  - javascript
  - jquery
  - plugin
  - tdd
---
I&#8217;m a big fan of TDD. I get nervous every time when I put some code it without having tests. I&#8217;m developing a simple jQuery plugin and I think hey we can TDD this.

## What is it?

The plugin is really simple. It turns ul tag to be taggable field. It&#8217;s similar to [tag-it][1] but with a lot less functionalities and doesn&#8217;t depend on jquery-ui

## What you need

I decided to use Karma because I&#8217;m going to test a lot of behaviours and Karma seems like a good fit as it run on real browser. Here&#8217;s how I setup my project. 

I chose jasmine-jquery because it&#8217;s easier to create some element to test and it&#8217;s easy to setup.

This is my **gulpfile.js**

```javascript

var gulp = require('gulp');
var karma = require('gulp-karma');

var testFiles = [
  'tests/vendors/jquery-1.11.3.min.js',
  'tests/vendors/jasmine-jquery.js',
  'src/**/*.js',
  'tests/spec/**/*.js'
];
/**
 * Run test once and exit
 */
gulp.task('test', function (done) {
  return gulp.src(testFiles)
    .pipe(karma({
      configFile: 'karma.conf.js',
      action: 'run'
    }))
  .on('error', function(err) {
    // Make sure failed tests cause gulp to exit non-zero 
    throw err;
  });
});

gulp.task('default', function() {
  gulp.src(testFiles)
    .pipe(karma({
      configFile: 'karma.conf.js',
      action: 'watch'
    }));
});

```

This is my **karma.conf.js**

``` javascript

module.exports = function(config) {
  config.set({
    browsers: ['PhantomJS'],
    frameworks: ['jasmine']
  });
};

```

Here&#8217;s my first test

``` javascript

describe('Taggify', function() {
  var fixture;
  beforeEach(function() {
    fixture = setFixtures('<ul id="tag"></ul>');
    jQuery('#tag').taggify();
  });
  
  it('should initialize text box', function() {
    var input = fixture.find('input');
    expect(input.length > 0).toBeTruthy();
  });

});

```

You will see that the test failed now we implement some code.

``` javascript

(function($) {
  $.fn.taggify = function(options) {
    create(this);
    return this;
  };

  function create($theElement) {
    var $input = $('<input class="tag-input"></input>')
      .attr('type', 'text')
      .attr('autocomplete', 'off')
      .wrap('<li></li>');

    $theElement.append($input.parent());
  }
})(jQuery);

```

Now the test passed. 

Now let&#8217;s add some event so when you hit enter the tag is added. So, I added one more test

``` javascript

  it('should add a tag', function() {
    var input = fixture.find('input');
    input.val('tag');
    input.trigger(jQuery.Event('keyup', { keyCode: 13 }));

    var tags = fixture.find('.tag-label');
    var tag = jQuery(tags[0]);
    
    expect(tag.html()).toBe('tag');
    expect(tags.length > 0).toBeTruthy();
  });

```

Now the test failed.

I&#8217;ll fix the test by doing this.

``` javascript

(function($) {
  $.fn.taggify = function(options) {
    create(this);
    return this;
  };

  function create($theElement) {
    var $input = $('<input class="tag-input"></input>')
      .attr('type', 'text')
      .attr('autocomplete', 'off')
      .wrap('<li></li>');

    $input.on('keyup', function(e) {
      if (e.keyCode === 13) {
        var tagText = $input.val();

        var $span = $('<span class="tag-label"></span>');

        $span.text(tagText).wrap('<li class="tag-choice"></li>');
        $theElement.prepend($span.parent());
        $input.val('');
      }
    });

    $theElement.append($input.parent());
  }
})(jQuery);

```

Now I want to add some negative test case.

``` javascript

  it('should not add a tag', function() {
    var input = fixture.find('input');
    input.trigger(jQuery.Event('keyup', { keyCode: 13 }));
    var tags = fixture.find('.tag-label');
    
    expect(tags.length > 0).toBeFalsy();
  });

```

Oops the test failed, looks like I missed something

I will fix the test by

``` javascript

(function($) {
  $.fn.taggify = function(options) {
    create(this);
    return this;
  };

  function create($theElement) {
    var $input = $('<input class="tag-input"></input>')
      .attr('type', 'text')
      .attr('autocomplete', 'off')
      .wrap('<li></li>');

    $input.on('keyup', function(e) {
      if (e.keyCode === 13) {
        var tagText = $input.val();
        if(tagText !== '') {
          var $span = $('<span class="tag-label"></span>');

          $span.text(tagText).wrap('<li class="tag-choice"></li>');
          $theElement.prepend($span.parent());
          $input.val('');
        }
      }
    });

    $theElement.append($input.parent());
  }
})(jQuery);

```

That&#8217;s it. I hope you enjoy and love TDD more. And here&#8217;s the [github repo][2]

 [1]: http://aehlke.github.io/tag-it/
 [2]: https://github.com/noppanit/taggify
