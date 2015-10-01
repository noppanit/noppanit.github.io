---
title: Oracle with GUID
author: Noppanit Charassinvichai
layout: post
permalink: /oracle-with-guid/
dsq_thread_id:
  - 195876598
categories:
  - Database
  - Oracle
tags:
  - guid
  - Oracle
---
Have you ever wanted to know that how Oracle generate GUID?

This is the answer. I found this website shows how to use Oracle to generate GUID for us.  
<http://feuerthoughts.blogspot.com/2006/02/watch-out-for-sequential-oracle-guids.html>

This is the code

<div class="codetop">
  SQL Package
</div>

<div class="codemain">
  CREATE OR REPLACE PACKAGE guid_pkg</p> 
  
  <p>
    IS
  </p>
  
  <p>
    SUBTYPE guid_t IS RAW (16);
  </p>
  
  <p>
    SUBTYPE formatted_guid_t IS VARCHAR2 (38);
  </p>
  
  <p>
    &#8212; Example: {34DC3EA7-21E4-4C8A-BAA1-7C2F21911524}
  </p>
  
  <p>
    c_mask CONSTANT formatted_guid_t
  </p>
  
  <p>
    := &#8216;{________-____-____-____-____________}&#8217;;
  </p>
  
  <p>
    FUNCTION is_formatted_guid (string_in IN VARCHAR2)
  </p>
  
  <p>
    RETURN BOOLEAN;
  </p>
  
  <p>
    FUNCTION formatted_guid (guid_in IN VARCHAR2)
  </p>
  
  <p>
    RETURN formatted_guid_t;
  </p>
  
  <p>
    FUNCTION formatted_guid
  </p>
  
  <p>
    RETURN formatted_guid_t;
  </p>
  
  <p>
    END guid_pkg;
  </p>
  
  <p>
    /
  </p>
</div>



<div class="codetop">
  SQL Body
</div>

<div class="codemain">
  <p>
    CREATE OR REPLACE PACKAGE BODY guid_pkg
  </p>
  
  <p>
    IS
  </p>
  
  <p>
    FUNCTION is_formatted_guid (string_in IN VARCHAR2)
  </p>
  
  <p>
    RETURN BOOLEAN
  </p>
  
  <p>
    IS
  </p>
  
  <p>
    BEGIN
  </p>
  
  <p>
    RETURN string_in LIKE c_mask;
  </p>
  
  <p>
    END is_formatted_guid;
  </p>
  
  <p>
    FUNCTION formatted_guid (guid_in IN VARCHAR2)
  </p>
  
  <p>
    RETURN formatted_guid_t
  </p>
  
  <p>
    IS
  </p>
  
  <p>
    BEGIN
  </p>
  
  <p>
    &#8212; If not already in the 8-4-4-4-rest format, then make it so.
  </p>
  
  <p>
    IF is_formatted_guid (guid_in)
  </p>
  
  <p>
    THEN
  </p>
  
  <p>
    RETURN guid_in;
  </p>
  
  <p>
    &#8212; Is it only missing those squiggly brackets?
  </p>
  
  <p>
    ELSIF is_formatted_guid (&#8216;{&#8216; || guid_in || &#8216;}&#8217;)
  </p>
  
  <p>
    THEN
  </p>
  
  <p>
    RETURN formatted_guid (&#8216;{&#8216; || guid_in || &#8216;}&#8217;);
  </p>
  
  <p>
    ELSE
  </p>
  
  <p>
    RETURN &#8216;{&#8216;
  </p>
  
  <p>
    || SUBSTR (guid_in, 1, 8 )
  </p>
  
  <p>
    || &#8216;-&#8216;
  </p>
  
  <p>
    || SUBSTR (guid_in, 9, 4)
  </p>
  
  <p>
    || &#8216;-&#8216;
  </p>
  
  <p>
    || SUBSTR (guid_in, 13, 4)
  </p>
  
  <p>
    || &#8216;-&#8216;
  </p>
  
  <p>
    || SUBSTR (guid_in, 17, 4)
  </p>
  
  <p>
    || &#8216;-&#8216;
  </p>
  
  <p>
    || SUBSTR (guid_in, 21)
  </p>
  
  <p>
    || &#8216;}&#8217;;
  </p>
  
  <p>
    END IF;
  </p>
  
  <p>
    END formatted_guid;
  </p>
  
  <p>
    FUNCTION formatted_guid
  </p>
  
  <p>
    RETURN formatted_guid_t
  </p>
  
  <p>
    IS
  </p>
  
  <p>
    BEGIN
  </p>
  
  <p>
    RETURN formatted_guid (SYS_GUID);
  </p>
  
  <p>
    END formatted_guid;
  </p>
  
  <p>
    END guid_pkg;
  </p>
  
  <p>
    /
  </p>
</div>