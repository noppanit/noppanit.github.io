---
title: 'Tutorial : Enable InnoDB for MySQL'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-enable-innodb-for-mysql/
dsq_thread_id:
  - 186274665
categories:
  - Database
---
1. Open the MySQL options file, the file is called my.cnf (Linux) &#8211; are in the / etc / my.cnf &#8211; or my.ini (Windows) &#8211; the path c: / windows / my.ini &#8212;

2. Find Education skip-InnoDB and comment # before adding it

3. E &#8216;recommended increasing the max\_allowed\_packet value to make sure you can upload files larger than 1MB.  
Then just below the line just commented write:  
set-variable = max\_allowed\_packet = 64M

4. Restart MySQL