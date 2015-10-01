---
title: 'Tutorial : Backup and Restore SQLExpress with C#'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-backup-and-restore-sqlexpress-with-c/
dsq_thread_id:
  - 186890505
categories:
  - .NET
  - Database
  - Programming
  - SQL Server
---
SQLExpress 2005 will use SMO to manage database, it ship drom DMO from older version (2000). In this topic I&#8217;ll talk about SMO.

If you are using SQLServer Express Edition must read this [topic][1]

<http://www.codeproject.com/useritems/SMODemo.asp> This is example application with SMO.

<http://www.sqldbatips.com/showarticle.asp?ID=34> Another example application.

However, I&#8217;ll present another way to use Backup and Restore database via C#, not using SMO. We&#8217;re using StoreProcedure. Sound wired aha, but I just find another ways HaHa.

> CREATE PROCEDURE BackUpDatabase  
> @name varchar(max)  
> AS  
> BACKUP DATABASE databasename TO @name  
> WITH FORMAT, NAME = &#8216;Full Database Backup&#8217;, SKIP, NOREWIND, NOUNLOAD, STATS = 10

This store procedure can backup database in the same way, but maybe not easy to use it. anyway I prefer to use SMO to backup and restore database, much more easier.

In c#

> myConnection = new &#8230;.  
> SqlCommand comadd = new SqlCommand(&#8220;BackUpDatabase&#8221;,myConnection);  
> comadd.CommandType = CommandType.StoredProcedure;
> 
> SqlParameter param1 = new SqlParameter(&#8220;@name&#8221;, name);  
> comadd.Parameters.Add(param1);
> 
> try  
> {  
> comadd.ExecuteNonQuery();  
> }  
> catch (Exception e)  
> {  
> Console.WriteLine(e.ToString());  
> }  
> finally  
> {  
> myConnection.Close();  
> }

Or you can use direct SQL direct to SqlCommand neither, It&#8217;s work fine.

 [1]: http://www.sqldbatips.com/showarticle.asp?ID=35