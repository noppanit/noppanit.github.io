---
title: Rails lost session after doing a POST
author: Noppanit Charassinvichai
layout: post
permalink: /rails-lost-session-after-doing-a-post/
dsq_thread_id:
  - 478543806
categories:
  - Rails
  - Ruby
---
I might be the only silly person on the Internet, because I haven&#8217;t found anyone having the same problem as I had before. So, in the future there might be someone like me. Basically, you have a rails application, you didn&#8217;t realise that if you do a POST from a plain  


<form>
  without using</p> 
  
  <div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
    <table cellspacing="0" cellpadding="0">
      <tr>
        <td class="line-numbers">
          <div>
            1<br />2<br />3<br />
          </div>
        </td>
        
        <td>
          <div class="ruby codecolorer">
            form_for<span class="br0">&#40;</span>@some<span class="br0">&#41;</span><br /> ...<br /> <span class="kw1">end</span>
          </div>
        </td>
      </tr>
    </table>
  </div>
  
  <p>
    You might be losing the session because of the security reason. According to this <a href="http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf" title="CSRF">reference</a>
  </p>
  
  <p>
    So, to be safe if you&#8217;re doing a POST don&#8217;t use plain<br /> 
    
    <form>
      tag. Only use form_for to generate the from and rails will handle everything. You can proof this theory easily by commenting out</p> 
      
      <div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
        <table cellspacing="0" cellpadding="0">
          <tr>
            <td class="line-numbers">
              <div>
                1<br />2<br />3<br />
              </div>
            </td>
            
            <td>
              <div class="ruby codecolorer">
                <span class="kw1">class</span> ApplicationController <span class="sy0"><</span> <span class="re2">ActionController::Base</span><br /> &nbsp; <span class="co1">#protect_from_forgery </span><br /> <span class="kw1">end</span>
              </div>
            </td>
          </tr>
        </table>
      </div>
      
      <p>
        Please don&#8217;t do this at production!
      </p>