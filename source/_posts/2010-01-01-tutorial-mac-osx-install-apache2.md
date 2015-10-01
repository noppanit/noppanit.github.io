---
title: 'Tutorial : Mac OSX install apache2'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-mac-osx-install-apache2/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/6ktd2D
wp_jd_target:
  - http://www.noppanit.com/tutorial-mac-osx-install-apache2/
dsq_thread_id:
  - 251280329
categories:
  - Mac OSX
---
I have just got a Mac which I have been waiting for a long time. Finally, I got it!!!. However, there are lots of stuff I don&#8217;t quite understand and to get it done, because I was a PC for over 10 years. This article, I will be install apache2 in Mac OSX.

## Install Gcc Compiler on Mac

1. Most websites that I googled don&#8217;t tell you this because I think every one should understand this one, but it&#8217;s not me. I will start with install gcc.  
2. First go to <https://connect.apple.com>  
3. Because every Mac haven&#8217;t got installed gcc compiler which is necessary to install apache.  
4. Go to Download > Developer Tools and download, xCode  
5. Install it!, now your system should have gcc compiler  
6. Go to [apache][1] and download apache for Unix version.

## How to install Apache on Mac

<table>
  <tr>
    <td>
      <a href="http://httpd.apache.org/docs/2.2/install.html#download">Download</a>
    </td>
    
    <td>
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
                $ lynx http://httpd.apache.org/download.cgi
              </div>
            </td>
          </tr>
        </table>
      </div>
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="http://httpd.apache.org/docs/2.2/install.html#extract">Extract</a>
    </td>
    
    <td>
      <div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
        <table cellspacing="0" cellpadding="0">
          <tr>
            <td class="line-numbers">
              <div>
                1<br />2<br />3<br />
              </div>
            </td>
            
            <td>
              <div class="text codecolorer">
                $ gzip -d httpd-NN.tar.gz<br /> $ tar xvf httpd-NN.tar<br /> $ cd httpd- NN
              </div>
            </td>
          </tr>
        </table>
      </div>
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="http://httpd.apache.org/docs/2.2/install.html#configure">Configure</a>
    </td>
    
    <td>
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
                $ ./configure --prefix=PREFIX
              </div>
            </td>
          </tr>
        </table>
      </div>
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="http://httpd.apache.org/docs/2.2/install.html#compile">Compile</a>
    </td>
    
    <td>
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
                $ make
              </div>
            </td>
          </tr>
        </table>
      </div>
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="http://httpd.apache.org/docs/2.2/install.html#install">Install</a>
    </td>
    
    <td>
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
                $ make install
              </div>
            </td>
          </tr>
        </table>
      </div>
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="http://httpd.apache.org/docs/2.2/install.html#customize">Customize</a>
    </td>
    
    <td>
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
                $ vi PREFIX/conf/httpd.conf
              </div>
            </td>
          </tr>
        </table>
      </div>
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="http://httpd.apache.org/docs/2.2/install.html#test">Test</a>
    </td>
    
    <td>
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
                $ PREFIX/bin/apachectl -k start
              </div>
            </td>
          </tr>
        </table>
      </div>
    </td>
  </tr>
</table>

I copied this instructions from apache website because I don&#8217;t want to miss something!!!.  
Reference: <http://httpd.apache.org/docs/2.2/install.html>

 [1]: http://httpd.apache.org/