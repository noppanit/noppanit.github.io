---
title: 'Rails Tutorial : Beer shop Part I &#8211; Scaffolding'
author: Noppanit Charassinvichai
layout: post
permalink: /rails-tutorial-beer-shop-part-i-scaffolding/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/8447xr
wp_jd_target:
  - http://www.noppanit.com/rails-tutorial-beer-shop-part-i-scaffolding/
dsq_thread_id:
  - 183380316
categories:
  - Rails
  - Ruby
---
I have decided to jump to rails, because I have seen how fast to build an application and how easy it is. I have been a Java Programmer quite a long time, and played with Grails and Rails as well. So, I decided to create this tutorial for my benefit to practice my rails techniques. It is an very simple beer shop. I will start from scratch.

Prerequisite.  
1. Netbeans (I use Netbeans because it provides the rails plugin and everything with one click.  
2. MySQL  
That&#8217;s it. Let&#8217;s start

1. Create a rails application  
[<img class="alignnone size-medium wp-image-432" title="create rails application" src="http://www.noppanit.com/wp-content/uploads/2009/12/1-300x204.png" alt="create rails application" width="300" height="204" />][1]

2. Call it BeerShop  
[<img class="alignnone size-medium wp-image-433" title="name" src="http://www.noppanit.com/wp-content/uploads/2009/12/2-300x193.png" alt="name" width="300" height="193" />][2]

3. Configure database: you have to put your own attributes; username and password that correspond with your database configure, don&#8217;t worry you can change it later at file database.yml  
[<img class="alignnone size-medium wp-image-434" title="configure database" src="http://www.noppanit.com/wp-content/uploads/2009/12/3-300x193.png" alt="configure database" width="300" height="193" />][3]

4. Click Finish

So now, you should have your first rails application created. Try and run it you will get this page. If you don&#8217;t get this page, you might have to check with your database configuration. If you are developing non-database application you might have to [turn off the database connection][4].  
[<img class="alignnone size-medium wp-image-435" title="first rails page" src="http://www.noppanit.com/wp-content/uploads/2009/12/4-300x149.png" alt="first rails page" width="300" height="149" />][5]

Next, we are creating a scaffolding, this magic command will create everything for us, CRUD and a simple page  
5. Right click on your project and choose generate  
[<img src="http://www.noppanit.com/wp-content/uploads/2009/12/5-300x176.png" alt="generate " title="generate " width="300" height="176" class="alignnone size-medium wp-image-438" />][6]

6.  
Model Name:

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
          beer
        </div>
      </td>
    </tr>
  </table>
</div>

Attributes Pairs (field:type) :

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
          name:string abv:string bottle_size:decimal case_size:decimal price:decimal
        </div>
      </td>
    </tr>
  </table>
</div>

Oh, ahh and don&#8217;t for get to create a database in MySQL as well

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">CREATE</span> <span class="kw1">DATABASE</span> BeerShop_development
        </div>
      </td>
    </tr>
  </table>
</div>

[<img src="http://www.noppanit.com/wp-content/uploads/2009/12/6-300x205.png" alt="create beer" title="create beer" width="300" height="205" class="alignnone size-medium wp-image-439" />][7]

Now we have got a schema already, we just have to migrate those to our database, by using db:migrate command or run

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          rake db:migrate
        </div>
      </td>
    </tr>
  </table>
</div>

[<img src="http://www.noppanit.com/wp-content/uploads/2009/12/8-300x176.png" alt="db:migrate" title="db:migrate" width="300" height="176" class="alignnone size-medium wp-image-442" />][8]

You will now have a beer already. try to run http://localhost:3000/beer on your browser. We will have CRUD beer ready to use. It&#8217;s a very ugly page. We will jazz with it later. 

[<img src="http://www.noppanit.com/wp-content/uploads/2009/12/9-300x149.png" alt="beer" title="beer" width="300" height="149" class="alignnone size-medium wp-image-443" />][9]

I&#8217;m gonna continue this next week.

 [1]: http://www.noppanit.com/wp-content/uploads/2009/12/1.png
 [2]: http://www.noppanit.com/wp-content/uploads/2009/12/2.png
 [3]: http://www.noppanit.com/wp-content/uploads/2009/12/3.png
 [4]: http://www.noppanit.com/ruby-on-rails-disable-database-connection/
 [5]: http://www.noppanit.com/wp-content/uploads/2009/12/4.png
 [6]: http://www.noppanit.com/wp-content/uploads/2009/12/5.png
 [7]: http://www.noppanit.com/wp-content/uploads/2009/12/6.png
 [8]: http://www.noppanit.com/wp-content/uploads/2009/12/8.png
 [9]: http://www.noppanit.com/wp-content/uploads/2009/12/9.png