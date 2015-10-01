---
title: 'Rails Tutorial : Add testing data by using migration'
author: Noppanit Charassinvichai
layout: post
permalink: /rails-tutorial-add-testing-data-by-using-migration/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/7W9hwh
wp_jd_target:
  - http://www.noppanit.com/rails-tutorial-add-testing-data-by-using-migration/
dsq_thread_id:
  - 264027996
categories:
  - Rails
  - Ruby
---
From previous tutorial [Rails Tutorial : Beer shop Part I – Scaffolding][1] I have show how to create a very simple scaffolding. This tutorial I will show how to create a testing data. Nobody wants to type SQL statement or add item manually every time they want to use the data. Rails has provided a handy tool to support this already. 

1. [<img src="http://www.noppanit.com/wp-content/uploads/2009/12/10-300x205.png" alt="add testing data" title="add testing data" width="300" height="205" class="alignnone size-medium wp-image-448" />][2]

2. This will create a file in migrate folder ready to use

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="kw1">class</span> AddTestData <span class="sy0"><</span> <span class="re2">ActiveRecord::Migration</span><br /> &nbsp; <span class="kw1">def</span> <span class="kw2">self</span>.<span class="me1">up</span><br /> &nbsp; <span class="kw1">end</span><br /> <br /> &nbsp; <span class="kw1">def</span> <span class="kw2">self</span>.<span class="me1">down</span><br /> &nbsp; <span class="kw1">end</span><br /> <span class="kw1">end</span>
        </div>
      </td>
    </tr>
  </table>
</div>

3. We now add test data by editing file add\_test\_data.rb

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="kw1">class</span> AddTestData <span class="sy0"><</span> <span class="re2">ActiveRecord::Migration</span><br /> &nbsp; <span class="kw1">def</span> <span class="kw2">self</span>.<span class="me1">up</span><br /> &nbsp; &nbsp; Beer.<span class="me1">delete_all</span><br /> &nbsp; &nbsp; Beer.<span class="me1">create</span><span class="br0">&#40;</span><span class="re3">:name</span> <span class="sy0">=></span> <span class="st0">"Artvelde"</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:abv</span> <span class="sy0">=></span> <span class="st0">"5.4%"</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:bottle_size</span> <span class="sy0">=></span> <span class="nu0">250</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:case_size</span> <span class="sy0">=></span> <span class="nu0">24</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:price</span> <span class="sy0">=></span> <span class="nu0">30.03</span><span class="br0">&#41;</span><br /> <br /> &nbsp; &nbsp; Beer.<span class="me1">create</span><span class="br0">&#40;</span><span class="re3">:name</span> <span class="sy0">=></span> <span class="st0">"Biere Du Boucanier Dark Ale"</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:abv</span> <span class="sy0">=></span> <span class="st0">"9%"</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:bottle_size</span> <span class="sy0">=></span> <span class="nu0">330</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:case_size</span> <span class="sy0">=></span> <span class="nu0">24</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:price</span> <span class="sy0">=></span> <span class="nu0">55.64</span><span class="br0">&#41;</span><br /> <br /> &nbsp; &nbsp; Beer.<span class="me1">create</span><span class="br0">&#40;</span><span class="re3">:name</span> <span class="sy0">=></span> <span class="st0">"Bush Ambree"</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:abv</span> <span class="sy0">=></span> <span class="st0">"12%"</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:bottle_size</span> <span class="sy0">=></span> <span class="nu0">250</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:case_size</span> <span class="sy0">=></span> <span class="nu0">24</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:price</span> <span class="sy0">=></span> <span class="nu0">50.98</span><span class="br0">&#41;</span><br /> <br /> &nbsp; &nbsp; Beer.<span class="me1">create</span><span class="br0">&#40;</span><span class="re3">:name</span> <span class="sy0">=></span> <span class="st0">"Cantillon Grand Cru Bruocsella"</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:abv</span> <span class="sy0">=></span> <span class="st0">"5%"</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:bottle_size</span> <span class="sy0">=></span> <span class="nu0">750</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:case_size</span> <span class="sy0">=></span> <span class="nu0">6</span>,<br /> &nbsp; &nbsp; &nbsp; <span class="re3">:price</span> <span class="sy0">=></span> <span class="nu0">46.5</span><span class="br0">&#41;</span><br /> &nbsp; <span class="kw1">end</span><br /> <br /> &nbsp; <span class="kw1">def</span> <span class="kw2">self</span>.<span class="me1">down</span><br /> &nbsp; &nbsp; Beer.<span class="me1">delete_all</span><br /> &nbsp; <span class="kw1">end</span><br /> <span class="kw1">end</span>
        </div>
      </td>
    </tr>
  </table>
</div>

 [1]: http://www.noppanit.com/rails-tutorial-beer-shop-part-i-scaffolding/
 [2]: http://www.noppanit.com/wp-content/uploads/2009/12/10.png