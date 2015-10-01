---
title: Public-key cryptography for dummies
author: Noppanit Charassinvichai
layout: post
permalink: /public-key-cryptography-for-dummies/
dsq_thread_id:
  - 998839988
categories:
  - Knowledges
---
For the last few days I have been busy in this amazing [29c3][1] conference in Hamburg, Germany (Not in NewYork). Basically, it&#8217;s a conference about everything that is about security and data. One thing that struck me was this talk [RSA factorisation in the real world][2] from [facthack][3]. Why it struck me, it&#8217;s because we have been using it a lot but I think I know nothing about it. And every time you Google about it, you get a lot of mathematical examples (Of course the algorithm is about maths). So, I guess I would just want to write it down so I could remember it myself also if it would benefit others that&#8217;d be fantastic. 

So, we all like Wikipedia, here&#8217;s the [wiki][4] version. But if you&#8217;re lazy like me you might want to watch this video which I think they virtualise it pretty good. 



And here is my version of it. I think the concept is basic and really easy to understand, though it took me a couple days to understand it. Imagine you want to send a note to a girl you like across the room where you have a lot of friends who try to bully or mock you. I ask the girl to buy a box with a lock and a key so nobody with that key can open the box. Then, she will send me the box across the room, it may pass a lot of people but they cannot open the box without her key. I will put the message in the box and close it and send it back. Then she could open that box with her key. I know this is not exactly right, but the point is that she has a key which is private-key and the box is public-key. As the names suggest, public means it&#8217;s wide open you can send it to anywhere publicly, but the key is private and you keep it. 

Another example that I can think of is SSH. I&#8217;m gonna skip what SSH is but when you want to connect to the server you need to enter a password and then the connection is open. So, one example that I can think of is Github. When you create an account on Github, it asks you to upload your public key. You have to do [these steps][5]

First, you use this command to generate public/private keys

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
          ssh-keygen -t rsa -C "your_email@youremail.com"
        </div>
      </td>
    </tr>
  </table>
</div>

Basically, that would generate public/private keys in your home folder. if you saved the keys in your home folder that you can view your keys.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          ls ~/.ssh/<br /> id_rsa&nbsp; &nbsp; id_rsa.pub&nbsp; known_hosts
        </div>
      </td>
    </tr>
  </table>
</div>

file **id_rsa.pub** is your public key and **id_rsa** is your private key. Then you upload **id_rsa.pub** to Github and then you can connect to Github via SSH without having to use password every time. I think EC2 and Heroku are the same. 

Now, we all love coding what about in code? I have some example here which is in Python and I think all the languages are the same.

I use the library **rsa**. You can install it easily

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
          pip install rsa
        </div>
      </td>
    </tr>
  </table>
</div>

Then you can generate the keys.

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="kw1">import</span> rsa<br /> <span class="br0">&#40;</span>public_key<span class="sy0">,</span> private_key<span class="br0">&#41;</span> <span class="sy0">=</span> rsa.<span class="me1">new_keys</span><span class="br0">&#40;</span><span class="nu0">2048</span><span class="br0">&#41;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

it might take a couple seconds to get the keys, but 2048 should be your standard by now. Now have a look at the keys

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="sy0">>>></span> public_key<br /> PublicKey<span class="br0">&#40;</span><span class="nu0">29534209309072966342236728315019059662080809378008690867170941707045309003902270154173510852052110681489591796447806519430369798984624459707158855145174351259726003060555580062598516787344976412595591636803388841296208018460473115348727377101381087280966955180437218649614860816115625029885144484815954440118725591030107342156415013995103531215123098501644397412095363703762543423709714830195367078829211889094350240474706872694251558468928015513092692877035574929167783047652545773000357002867146591894383127690358099462086703188180088169904549856171296368406173474768408900722887810563868713819753518447862895139133</span><span class="sy0">,</span> <span class="nu0">65537</span><span class="br0">&#41;</span><br /> <br /> <span class="sy0">>>></span> private_key<br /> PrivateKey<span class="br0">&#40;</span><span class="nu0">29534209309072966342236728315019059662080809378008690867170941707045309003902270154173510852052110681489591796447806519430369798984624459707158855145174351259726003060555580062598516787344976412595591636803388841296208018460473115348727377101381087280966955180437218649614860816115625029885144484815954440118725591030107342156415013995103531215123098501644397412095363703762543423709714830195367078829211889094350240474706872694251558468928015513092692877035574929167783047652545773000357002867146591894383127690358099462086703188180088169904549856171296368406173474768408900722887810563868713819753518447862895139133</span><span class="sy0">,</span> <span class="nu0">65537</span><span class="sy0">,</span> <span class="nu0">5853484973611070995305138533710462272468493110929015451938345695299014581865001251698425812248117332832877730809474936003800499244873691306228334673248236088203321082038488631354687192743395312925586153935017130164585592135482022296788377575565542253879179407642996063900505472336632032487580151280432952533330871039500260846987279615245989379283555335473200579408998561597984286865492093479293281454202362991371489340478090036107586685417432250640745863007335226075029799578308740141059780564838880874147399808234159082348507409570253455570613403424844782542465277813808638221548094905955710788792599684368754627553</span><span class="sy0">,</span> <span class="nu0">3048836616267442645717253566428183242785699256710435915408206917831986485110304443207329137538405008020749764914855054897471943691960276026164383471359068144785145380429590398022467222960109449831417790058882587360642554647616357991607084035635835566066548855867645483820873548134124697487374239771390745052467948610194583244121</span><span class="sy0">,</span> <span class="nu0">9687042313612202470579779908557945791161444599629082668056659471372738761222623451977742705688117439787620866981353449588434275887551340654960295016278042883725967841149851338806541074750203724704414741041773527871314525574722367110086522054749464369889004170596421460710729163676852042373</span><span class="br0">&#41;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

You can see some prime numbers. Then, I will send the **public_key** to my friend, or Github. Now my friend with encrypt the message and send it back to me.

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="sy0">>>></span> crypto <span class="sy0">=</span> rsa.<span class="me1">encrypt</span><span class="br0">&#40;</span><span class="st0">"Encrypted_Message"</span><span class="sy0">,</span> public_key<span class="br0">&#41;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

You will get an encrypted message, we can take a peek let&#8217;s see what&#8217;s inside

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="sy0">>>></span> crypto<br /> <span class="st0">"<span class="es0">\x</span>95G<span class="es0">\x</span>0eZ<span class="es0">\x</span>ad<span class="es0">\x</span>fb-<span class="es0">\x</span>e1<span class="es0">\x</span>d3<span class="es0">\x</span>8a<span class="es0">\x</span>a5<span class="es0">\x</span>0e;<span class="es0">\x</span>f2<span class="es0">\x</span>a4%<span class="es0">\x</span>c4@<span class="es0">\x</span>9f<span class="es0">\x</span>c8<span class="es0">\x</span>d9<span class="es0">\x</span>f8<span class="es0">\x</span>ab<span class="es0">\x</span>9cI8<span class="es0">\x</span>83A/0<span class="es0">\x</span>9e<span class="es0">\\</span><span class="es0">\x</span>c4_?<span class="es0">\x</span>a5<span class="es0">\x</span>12y<span class="es0">\x</span>12<span class="es0">\x</span>cfz E<span class="es0">\x</span>d4{d<span class="es0">\x</span>e6Hk<span class="es0">\x</span>aa<span class="es0">\x</span>88<span class="es0">\x</span>be<span class="es0">\x</span>08<span class="es0">\x</span>d3S<span class="es0">\x</span>05c<span class="es0">\x</span>f5<span class="es0">\x</span>99&<span class="es0">\x</span>19<span class="es0">\x</span>0bxHx/|<span class="es0">\x</span>b9<span class="es0">\x</span>85<span class="es0">\x</span>98<span class="es0">\x</span>a6<span class="es0">\x</span>8f<span class="es0">\x</span>7f<span class="es0">\x</span>13<span class="es0">\x</span>98/<span class="es0">\x</span>aed<span class="es0">\x</span>1a<span class="es0">\x</span>aaeOS(<span class="es0">\x</span>f2<span class="es0">\x</span>fcG<span class="es0">\x</span>19MH<span class="es0">\x</span>dd<span class="es0">\x</span>ed<span class="es0">\x</span>db<span class="es0">\x</span>e9<span class="es0">\x</span>df<span class="es0">\x</span>d8k<span class="es0">\x</span>16xy<span class="es0">\x</span>b1<span class="es0">\x</span>12<span class="es0">\x</span>17<span class="es0">\x</span>fduG<span class="es0">\x</span>d57G<span class="es0">\x</span>02<span class="es0">\x</span>fe<span class="es0">\x</span>9e<span class="es0">\x</span>87<span class="es0">\x</span>02Z?<span class="es0">\x</span>f5<span class="es0">\x</span>c09,3<span class="es0">\x</span>d4b<span class="es0">\x</span>06<span class="es0">\x</span>11<span class="es0">\x</span>f1<span class="es0">\x</span>e2H<span class="es0">\x</span>7f<span class="es0">\x</span>a3?<span class="es0">\x</span>a8<span class="es0">\x</span>88<span class="es0">\x</span>ef<span class="es0">\x</span>95<span class="es0">\x</span>c7<span class="es0">\x</span>b2<span class="es0">\x</span>7f<span class="es0">\x</span>a1y7u<span class="es0">\x</span>df<span class="es0">\x</span>10%<span class="es0">\x</span>fbe*<span class="es0">\x</span>fd)<span class="es0">\x</span>ae<span class="es0">\x</span>cb=<span class="es0">\n</span><span class="es0">\x</span>ddX:<span class="es0">\x</span>cd&<span class="es0">\x</span>ca<span class="es0">\x</span>85i:lJ<span class="es0">\x</span>c8tGg<span class="es0">\x</span>9b<span class="es0">\x</span>d9<span class="es0">\x</span>1c;`<span class="es0">\x</span>e4<span class="es0">\x</span>873<span class="es0">\x</span>82<span class="es0">\x</span>1d<span class="es0">\x</span>11<span class="es0">\x</span>c3P<span class="es0">\x</span>f8z<span class="es0">\x</span>a4eU<span class="es0">\x</span>a3V<span class="es0">\\</span>4<span class="es0">\x</span>8ai<span class="es0">\x</span>a7<span class="es0">\x</span>9a<span class="es0">\x</span>cfY<span class="es0">\x</span>fd<span class="es0">\x</span>ed<span class="es0">\x</span>1b<span class="es0">\x</span>ae<span class="es0">\x</span>b7<span class="es0">\x</span>e17<span class="es0">\x</span>163~<span class="es0">\x</span>1a<span class="es0">\x</span>bb<span class="es0">\x</span>0e<span class="es0">\x</span>d8w3#<span class="es0">\x</span>83<span class="es0">\x</span>ea4<span class="es0">\x</span>b68<span class="es0">\x</span>a1<span class="es0">\x</span>9b<span class="es0">\x</span>88T'<span class="es0">\x</span>9c<span class="es0">\x</span>a9<span class="es0">\x</span>9a<span class="es0">\x</span>bc<span class="es0">\x</span>1f0FP[}<span class="es0">\r</span><span class="es0">\x</span>908<span class="es0">\x</span>8b<span class="es0">\x</span>95<span class="es0">\x</span>a2<span class="es0">\x</span>f5<span class="es0">\x</span>b8<span class="es0">\x</span>16Xi<span class="es0">\x</span>d5<span class="es0">\x</span>d0>o<span class="es0">\x</span>e5<span class="es0">\x</span>93<span class="es0">\x</span>abg<span class="es0">\x</span>a4<span class="es0">\x</span>e7L"</span>
        </div>
      </td>
    </tr>
  </table>
</div>

You can see it&#8217;s gibberish. Then my friend can send this **crpyto** back to me. And I&#8217;ll try to decrypt it.

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="sy0">>>></span> rsa.<span class="me1">decrypt</span><span class="br0">&#40;</span>crypto<span class="sy0">,</span>private_key<span class="br0">&#41;</span><br /> <span class="st0">'Encrypted_Message'</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Now let&#8217;s try to decrypt the message with some other private key. You&#8217;ll get this.

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="sy0">>>></span> <span class="br0">&#40;</span>newpublic_key<span class="sy0">,</span>newprivate_key<span class="br0">&#41;</span> <span class="sy0">=</span> rsa.<span class="me1">newkeys</span><span class="br0">&#40;</span><span class="nu0">2048</span><span class="br0">&#41;</span><br /> <span class="sy0">>>></span> rsa.<span class="me1">decrypt</span><span class="br0">&#40;</span>crypto<span class="sy0">,</span> newprivate_key<span class="br0">&#41;</span><br /> Traceback <span class="br0">&#40;</span>most recent call last<span class="br0">&#41;</span>:<br /> &nbsp; File <span class="st0">"<stdin>"</span><span class="sy0">,</span> line <span class="nu0">1</span><span class="sy0">,</span> <span class="kw1">in</span> <span class="sy0"><</span>module<span class="sy0">></span><br /> &nbsp; File <span class="st0">"/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/rsa/pkcs1.py"</span><span class="sy0">,</span> line <span class="nu0">232</span><span class="sy0">,</span> <span class="kw1">in</span> decrypt<br /> &nbsp; &nbsp; <span class="kw1">raise</span> DecryptionError<span class="br0">&#40;</span><span class="st0">'Decryption failed'</span><span class="br0">&#41;</span><br /> rsa.<span class="me1">pkcs1</span>.<span class="me1">DecryptionError</span>: Decryption failed
        </div>
      </td>
    </tr>
  </table>
</div>

If you&#8217;re interested some really hardcore stuff how to hack it. I recommend he talk from 29c3 conference.

 [1]: http://events.ccc.de/congress/2012/wiki/Main_Page "29c3"
 [2]: http://events.ccc.de/congress/2012/Fahrplan/events/5275.en.html "RSA factorisation in the real world"
 [3]: http://facthacks.cr.yp.to/ "face hacks"
 [4]: http://en.wikipedia.org/wiki/Public-key_cryptography "public key cryptography"
 [5]: https://help.github.com/articles/generating-ssh-keys "Github upload ssh keys"