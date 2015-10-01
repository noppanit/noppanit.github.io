---
title: If task manager on windows has been disabled
author: Noppanit Charassinvichai
layout: post
permalink: /if-task-manager-on-windows-has-been-disabled/
dsq_thread_id:
  - 243535111
categories:
  - Windows
---
I have been attacked by Spyware, and it disabled my task manager. So, I coundn&#8217;t use CTRL+ALT+DEL at all. I have to re-open it again by using Group Policy.

1. Open Run command and type : Gpedit.msc  
2. From User Configuration -> Administrative Templates -> System ->  
Ctrl+Alt+Del Options -> Remove Task Manger  
3. Change the state to be &#8220;Disabled&#8221;  
4. Finish, you can use task manager now. or by using HotKey : Ctrl+L_Shife+ESC.

Or you can look into the registry.  
HKEY\_LOCAL\_MACHIN\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\  
system\DisabledTaskMgr

Set it to &#8220;1&#8221;