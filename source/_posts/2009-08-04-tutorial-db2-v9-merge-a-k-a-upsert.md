---
title: 'Tutorial : DB2 V9 MERGE (A.K.A UPSERT)'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-db2-v9-merge-a-k-a-upsert/
dsq_thread_id:
  - 183380077
categories:
  - DB2
---
Well, I am not a DBA and I don&#8217;t know something like this very much. But my company encourage me to take a course on DB2 V.9. And I have one command that I wanted to remember and I know that it will benefit me later on. [MERGE][1]

So, basically, you have to table and you want to merge it together. I will explain it in a real table.

<table border="0">
  <tr>
    <td>
      T1
    </td>
    
    <td>
      M1
    </td>
  </tr>
  
  <tr>
    <td>
      <table border="1" width="100%">
        <tr>
          <td>
            ID
          </td>
          
          <td>
            AMOUNT
          </td>
        </tr>
        
        <tr>
          <td>
            1
          </td>
          
          <td>
            100
          </td>
        </tr>
        
        <tr>
          <td>
            2
          </td>
          
          <td>
            200
          </td>
        </tr>
        
        <tr>
          <td colspan="2">
            .
          </td>
        </tr>
      </table>
    </td>
    
    <td>
      <table border="1">
        <tr>
          <td>
            ID
          </td>
          
          <td>
            AMOUNT
          </td>
        </tr>
        
        <tr>
          <td>
            1
          </td>
          
          <td>
            100
          </td>
        </tr>
        
        <tr>
          <td>
            2
          </td>
          
          <td>
            200
          </td>
        </tr>
        
        <tr>
          <td>
            3
          </td>
          
          <td>
            200
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

So, we have two tables, M1 and T1. T1 has a row number 3 that M1 doesn&#8217;t have. So, if you run the MERGE command. First DB2 will UPDATE everything that the first table has in the second table. Moreover, a little bit more extra in T1 row number 3 that M1 doesn&#8217;t have. DB2 will INSERT it into T1.

Therefore, this will save you a huge amount of time to do SELECT whether T1 has row number and M1 has row number and UPDATE it. And check again and again. You could do it in one command.

<pre><div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">MERGE</span> <span class="kw1">INTO</span> M1<br />
          <span class="kw1">USING</span> <span class="br0">&#40;</span> <span class="kw1">SELECT</span> ID<span class="sy0">,</span> AMOUNT <span class="kw1">FROM</span> M1 <span class="br0">&#41;</span><br />
          <span class="kw1">AS</span> T1 <span class="br0">&#40;</span>ID<span class="sy0">,</span> AMOUNT<span class="br0">&#41;</span><br />
          <span class="kw1">ON</span> <span class="br0">&#40;</span> M1<span class="sy0">.</span>ID <span class="sy0">=</span> T1<span class="sy0">.</span>ID <span class="br0">&#41;</span><br />
          <span class="kw1">WHEN</span> MATCHED <span class="kw1">THEN</span><br />
          &nbsp;<span class="kw1">UPDATE</span> <span class="kw1">SET</span> AMOUNT <span class="sy0">=</span> AMOUNT <span class="sy0">+</span> T1<span class="sy0">.</span>AMOUNT<br />
          <span class="kw1">WHEN</span> <span class="kw1">NOT</span> MATCHED <span class="kw1">THEN</span><br />
          &nbsp;<span class="kw1">INSERT</span> <span class="br0">&#40;</span> ID<span class="sy0">,</span> AMOUNT <span class="br0">&#41;</span> <span class="kw1">VALUES</span> <span class="br0">&#40;</span>T1<span class="sy0">.</span>ID<span class="sy0">,</span> T1<span class="sy0">.</span>AMOUNT<span class="br0">&#41;</span>;
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

 [1]: http://publib.boulder.ibm.com/infocenter/db2luw/v9/index.jsp?topic=/com.ibm.db2.udb.admin.doc/doc/r0010873.htm