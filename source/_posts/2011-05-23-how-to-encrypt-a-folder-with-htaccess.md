---
title: How to encrypt a folder with .htaccess
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-encrypt-a-folder-with-htaccess/
dsq_thread_id:
  - 311451876
categories:
  - Knowledges
---
I know there are so much articles about this topic, but I just want to increase this by just one article. 

I have come across where I have to encrypt my upload folder on my server, and I think this is the most convenient way to do just that. You could use Javascript or even PHP or any languages you favourite. 

Basically, you will need to upload .htaccess with this content to the folder you want to prompt username and password to access.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          AuthType Basic<br /> AuthName "Upload"<br /> AuthUserFile "${ABSOLUTE_SERVER_PATH}/passwd"<br /> require valid-user
        </div>
      </td>
    </tr>
  </table>
</div>

and upload passwd file ${ABSOLUTE\_SERVER\_PATH} where the location of this file should correspond to where you put the path in AuthUserFile in .htaccess

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
          username:password <br /> #Replace the username with any username you want.<br /> #Replace the password with any password you want.
        </div>
      </td>
    </tr>
  </table>
</div>

And reload the server, BAM! You folder is encrypted.