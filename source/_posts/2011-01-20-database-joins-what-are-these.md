---
title: 'Database Joins: What are these?'
author: Noppanit Charassinvichai
layout: post
permalink: /database-joins-what-are-these/
dsq_thread_id:
  - 213147973
categories:
  - Knowledges
---
Somebody told me that, if you can&#8217;t write anything down and explain in words, you don&#8217;t understand it. That was my lecturer. So, and I got asked about database joins yesterday and I couldn&#8217;t even explain a bit. Thus, I have to write something down to refresh my memory.

First, we need to prepare something and I think learning by example is the best way to learn something. I will use MySQL as the main tool.

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">CREATE</span> <span class="kw1">DATABASE</span> testjoins;<br /> <span class="kw1">USE</span> testjoins;
        </div>
      </td>
    </tr>
  </table>
</div>

And this is the sample tables that we will work with

**Student Table**  
[table id=1 /] 

**Course Table**  
[table id=2 /] 

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">CREATE</span> <span class="kw1">TABLE</span> student<span class="br0">&#40;</span><br /> StudentName <span class="kw1">VARCHAR</span> <span class="br0">&#40;</span><span class="nu0">25</span><span class="br0">&#41;</span><span class="sy0">,</span><br /> CourseID <span class="kw1">INT</span><span class="br0">&#41;</span>;
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">CREATE</span> <span class="kw1">TABLE</span> course<span class="br0">&#40;</span><br /> CourseID <span class="kw1">INT</span><span class="sy0">,</span><br /> CourseName <span class="kw1">VARCHAR</span> <span class="br0">&#40;</span><span class="nu0">25</span><span class="br0">&#41;</span> <span class="br0">&#41;</span>;
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">ALTER</span> <span class="kw1">TABLE</span> student<br /> <span class="kw1">ADD</span> <span class="kw1">CONSTRAINT</span> fk_student_course<br /> <span class="kw1">FOREIGN</span> <span class="kw1">KEY</span> <span class="br0">&#40;</span>courseid<span class="br0">&#41;</span><br /> <span class="kw1">REFERENCES</span> course<span class="br0">&#40;</span>courseid<span class="br0">&#41;</span>;
        </div>
      </td>
    </tr>
  </table>
</div>

Here is the data

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">INSERT</span> <span class="kw1">INTO</span> student <span class="kw1">VALUES</span> <span class="br0">&#40;</span><span class="st0">'John'</span><span class="sy0">,</span><span class="nu0">1</span><span class="br0">&#41;</span>;<br /> <span class="kw1">INSERT</span> <span class="kw1">INTO</span> student <span class="kw1">VALUES</span> <span class="br0">&#40;</span><span class="st0">'Jane'</span><span class="sy0">,</span><span class="nu0">2</span><span class="br0">&#41;</span>;<br /> <span class="kw1">INSERT</span> <span class="kw1">INTO</span> student <span class="kw1">VALUES</span> <span class="br0">&#40;</span><span class="st0">'Ken'</span><span class="sy0">,</span><span class="kw1">NULL</span><span class="br0">&#41;</span>;<br /> <span class="kw1">INSERT</span> <span class="kw1">INTO</span> course <span class="kw1">VALUES</span> <span class="br0">&#40;</span><span class="nu0">1</span><span class="sy0">,</span><span class="st0">'Maths'</span><span class="br0">&#41;</span>;<br /> <span class="kw1">INSERT</span> <span class="kw1">INTO</span> course <span class="kw1">VALUES</span> <span class="br0">&#40;</span><span class="nu0">2</span><span class="sy0">,</span><span class="st0">'Chemistry'</span><span class="br0">&#41;</span>;
        </div>
      </td>
    </tr>
  </table>
</div>

So now, you will have the tables and data you need to learn about joins. First, joins are divided into two categories, Inner and Outer joins. I will start off with the inner join, because it&#8217;s easier to understand.

**Inner Join**  
Inner join is the most common join we have seen in our development life.

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">SELECT</span> StudentName<span class="sy0">,</span> CourseName <br /> <span class="kw1">FROM</span> student <span class="kw1">INNER</span> <span class="kw1">JOIN</span> course <br /> <span class="kw1">ON</span> student<span class="sy0">.</span>courseid <span class="sy0">=</span> course<span class="sy0">.</span>courseid;
        </div>
      </td>
    </tr>
  </table>
</div>

This sql is equivalent to

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">SELECT</span> StudentName<span class="sy0">,</span> CourseName <br /> <span class="kw1">FROM</span> student<span class="sy0">,</span> course <br /> <span class="kw1">WHERE</span> student<span class="sy0">.</span>courseid <span class="sy0">=</span> course<span class="sy0">.</span>courseid
        </div>
      </td>
    </tr>
  </table>
</div>

The result is  
[table id=3 /] 

The database compares each row of the two tables and find all pairs indicated in the join-predicate. Note that, Ken doesn&#8217;t have course id so the result will not show Ken in the result table.

**Outer join**  
Outer join does not require matching record in each table. Outer Join can be seen as Left, Right and Full Outer joins.

First, left outer join will look at the table to the left and find only record to the left table. The query will not care if the right table contains null value and still show the result anyway. For example.

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">SELECT</span> StudentName<span class="sy0">,</span> CourseName <br /> <span class="kw1">FROM</span> student <span class="kw1">LEFT</span> <span class="kw1">OUTER</span> <span class="kw1">JOIN</span> course <br /> <span class="kw1">ON</span> student<span class="sy0">.</span>courseid <span class="sy0">=</span> course<span class="sy0">.</span>courseid;
        </div>
      </td>
    </tr>
  </table>
</div>

This is the result.  
[table id=4 /] 

You can see that Ken is shown on the result table as well whether ken has any course in the database. So, it shows NULL result.

Right Outer Join is the same as Left Outer Join but it gives priority to table to the right and shows all records from the right table.

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">SELECT</span> StudentName<span class="sy0">,</span> CourseName <br /> <span class="kw1">FROM</span> student <span class="kw1">RIGHT</span> <span class="kw1">OUTER</span> <span class="kw1">JOIN</span> course <br /> <span class="kw1">ON</span> student<span class="sy0">.</span>courseid <span class="sy0">=</span> course<span class="sy0">.</span>courseid;
        </div>
      </td>
    </tr>
  </table>
</div>