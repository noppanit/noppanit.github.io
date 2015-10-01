---
title: 'Tutorial : Implement AJAX to your wordpress theme.'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-implement-ajax-to-your-wordpress-theme/
dsq_thread_id:
  - 296934766
categories:
  - PHP
---
I&#8217;m trying to implement AJAX on wordpres theme. I have scouted around the Internet and I found quite a few articles about it, so I think I would write one more to increase the search results. 

Before starting, I think it would be great to read this article. <http://www.garyc40.com/2010/03/5-tips-for-using-ajax-in-wordpress/#form>. The article tells you what dos and don&#8217;ts in using AJAX in wordpress. 

Okay, now let&#8217;s do some AJAX in wordpress. 

So, first let&#8217;s create a template in theme folder called helloworld.php

<div class="codecolorer-container php blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />
        </div>
      </td>
      
      <td>
        <div class="php codecolorer">
          <span class="kw2"><?php</span> <br /> <br /> <span class="coMULTI">/*<br /> Template Name: HelloWorld Page<br /> */</span><br /> <br /> get_header<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="sy1">?></span><br /> <div><br /> &nbsp; Name: <input type="text" id="name" name="name"/> <br /> &nbsp; <input type="button" id="submitButton" value="submit"/><br /> </div><br /> <div id="result"><br /> </div><br /> <br /> <script><br /> <br /> &nbsp; jQuery('#submitButton').click( function() <br /> &nbsp; {<br /> &nbsp; &nbsp; var data = {};<br /> &nbsp; &nbsp; data.name = jQuery('#name').val();<br /> &nbsp; &nbsp; data.action = "helloworld_action"; // The action that needs to be in the request to let Wordpress hooks with a callback<br /> &nbsp; &nbsp; jQuery.post('http://www.url.com/wp-admin/admin-ajax.php',data, successFunction);<br /> &nbsp; });<br /> &nbsp; <br /> &nbsp; &nbsp; &nbsp; &nbsp; // onSuccessFunction<br /> &nbsp; function successFunction(result)<br /> &nbsp; {<br /> &nbsp; &nbsp; alert(result);<br /> &nbsp; }<br /> </script><br /> <span class="kw2"><?php</span> get_sidebar<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span> get_footer<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span> <span class="sy1">?></span>
        </div>
      </td>
    </tr>
  </table>
</div>

Then you have to add a new page with Template Name of HelloWorld Page with blank content you will see something like this when you go to the page you&#8217;ve just created.

[<img src="http://www.noppanit.com/wp-content/uploads/2011/05/Screen-shot-2011-05-06-at-15.11.38-300x149.png" alt="AJAX on WordPress theme" title="Screen shot 2011-05-06 at 15.11.38" width="300" height="149" class="alignnone size-medium wp-image-747" />][1]

And you just have to hook this function in functions.php inside the theme folder

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          add_action('wp_ajax_helloworld_action' , 'print_hello'); // When user login<br /> add_action('wp_ajax_nopriv_helloworld_action' , 'print_hello'); // When user not loggin<br /> <br /> function print_hello()<br /> {<br /> &nbsp; echo "Hello " . $_POST['name'] ;<br /> &nbsp; die(); // You have to die before the response is back, otherwise you would get an extra "0"<br /> }
        </div>
      </td>
    </tr>
  </table>
</div>

Now when you fill in the textbox and click the button you will get a pop up &#8220;Hello&#8221; + with your content in the textbox.

 [1]: http://www.noppanit.com/wp-content/uploads/2011/05/Screen-shot-2011-05-06-at-15.11.38.png