---
title: 'Oracle BAM : Collect and populate real-time data from AQ JMS'
author: Noppanit Charassinvichai
layout: post
permalink: /oracle-bam-collect-and-populate-real-time-data-from-aq-jms/
dsq_thread_id:
  - 187802900
categories:
  - Knowledges
---
I have been assigned an assignment which is using oracle bam with AQ JMS. For one reason why I have to do this because we don&#8217;t have BPEL for designing flow of data. So, I have to use Enterprise Link instead.

Objectives:  
1. Create queue, queue table and user-defined object type in Oracle XE.  
2. Configure BAM to collect and populate real-time data into ADC.  
**  
Create user and grant privilege  
**1. In order to use aq in Oracle Database, we have to grant privilege to user.

<div class="codetop">
  SQL Script
</div>

<div class="codemain">
  connect sys/welcome1@db10g as sysdba<br /> grant SELECT_CATALOG_ROLE TO scott;<br /> GRANT EXECUTE ON DBMS_APPLY_ADM TO scott;<br /> GRANT EXECUTE ON DBMS_AQ TO scott;<br /> GRANT EXECUTE ON DBMS_AQADM TO scott;<br /> GRANT EXECUTE ON DBMS_CAPTURE_ADM TO scott;<br /> GRANT EXECUTE ON DBMS_FLASHBACK TO scott;<br /> GRANT EXECUTE ON DBMS_STREAMS_ADM TO scott;<br /> execute dbms_aqadm.grant_system_privilege(&#8216;ENQUEUE_ANY&#8217;, &#8216;scott&#8217;, TRUE);<br /> grant aq_administrator_role to scott;<br /> grant execute on dbms_lock to scott;<br /> grant execute on sys.dbms_aqin to scott;<br /> grant execute on sys.dbms_aqjms to scott;<br /> exit;
</div>

</br>  
Note: If the user is locked. run this script

<div class="codetop">
  SQL Script
</div>

<div class="codemain">
  ALTER USER scott ACCOUNT UNLOCK;
</div>

</br>  
2. Connect to database as scott user to create AQ

<div class="codetop">
  SQL Script
</div>

<pre style="overflow: auto;">connect scott/tiger@db10g
execute dbms_aqadm.create_queue_table( queue_table => 'bam_ttq_tab',queue_payload_type => 'sys.aq$_jms_text_message', multiple_consumers => true );
execute dbms_aqadm.create_queue( queue_name => 'bam_ttq', queue_table =>'bam_ttq_tab' );
execute dbms_aqadm.start_queue( queue_name => 'bam_ttq' );
</pre>