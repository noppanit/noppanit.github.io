---
title: Little JavaScript to check if the page contain multiple IDs
author: Noppanit Charassinvichai
layout: post
permalink: /little-javascript-to-check-if-the-page-contain-multiple-ids/
dsq_thread_id:
  - 1014673682
categories:
  - Javascript
tags:
  - javascript
---
I know this shouldn&#8217;t happen at all these days, but as you have a lot of people contributing to one single repository. This thing might happen. So, this is just purely for myself. I just use jQuery to create a little util method which is executed every time the browser is loaded to check if the page contains any multiple IDs.

``` javascript
    detect_dub_ids : function() {
        var dupIds = [];
        $('[id]').each(function () {
            var $ids = $('[id=' + this.id + ']');
            if ($ids.length > 1 && $ids[0] === this) {
                dupIds.push(this.id);
            }
        });

        return dupIds;

    },

    get_display_text_for_dup_ids : function(ids) {
        var h = {},
            text = "";
        jQuery(ids).each(function(index, value) {
            if(h[value]) {;
                h[value].push(value);
            } else {
                h[value] = [value];
            }
        });

        for (var k in h) {
            text += "#"+k+ " ("+h[k].length+") times ";
        }

        return text;
    }
```
