---
title: 'nmap: Scan which ip addresses are up'
author: Noppanit Charassinvichai
layout: post
permalink: /nmap-scan-which-ip-addresses-are-up/
dsq_thread_id:
  - 195561305
categories:
  - Knowledges
---
Well, I write this article because of my pure ignorance. I&#8217;m quite into Network and Security right now.

I&#8217;m always reset my router and rearrange DHCP. And sometimes I cannot find ip addresses of my other computers and I don&#8217;t want to walk to those computers and ifconfig them individually. So, there must be other ways to know which ip addresses are up in the network. 

These days, there are several port scanners over the Internet, but I&#8217;m old school. So, I go back to the most basic thing, [nmap][1]

You just install nmap, you can use apt-get install nmap or port install nmap in Linux and Mac. After that, just type this command.

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
          nmap -sP 192.168.1.0/24
        </div>
      </td>
    </tr>
  </table>
</div>

This command will scan the ip address from 192.168.1.0 &#8211; 192.168.1.255 and report which ip addresses are up. 

This is the possible result.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          Starting Nmap 5.21 ( http://nmap.org ) at 2010-12-22 12:04 ICT<br /> Nmap scan report for 192.168.1.1<br /> Host is up (0.0098s latency).<br /> Nmap scan report for 192.168.1.100<br /> Host is up (0.00044s latency).<br /> Nmap scan report for 192.168.1.102<br /> Host is up (0.0096s latency).<br /> Nmap done: 256 IP addresses (3 hosts up) scanned in 2.40 seconds
        </div>
      </td>
    </tr>
  </table>
</div>

It shows that there are 3 ip addresses are up and active.

 [1]: http://nmap.org/