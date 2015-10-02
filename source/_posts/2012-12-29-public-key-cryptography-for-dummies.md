---
title: Public-key cryptography for dummies
comments: true
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

<iframe width="420" height="315" src="https://www.youtube.com/embed/wXB-V_Keiu8" frameborder="0" allowfullscreen></iframe>

And here is my version of it. I think the concept is basic and really easy to understand, though it took me a couple days to understand it. Imagine you want to send a note to a girl you like across the room where you have a lot of friends who try to bully or mock you. I ask the girl to buy a box with a lock and a key so nobody with that key can open the box. Then, she will send me the box across the room, it may pass a lot of people but they cannot open the box without her key. I will put the message in the box and close it and send it back. Then she could open that box with her key. I know this is not exactly right, but the point is that she has a key which is private-key and the box is public-key. As the names suggest, public means it&#8217;s wide open you can send it to anywhere publicly, but the key is private and you keep it. 

Another example that I can think of is SSH. I&#8217;m gonna skip what SSH is but when you want to connect to the server you need to enter a password and then the connection is open. So, one example that I can think of is Github. When you create an account on Github, it asks you to upload your public key. You have to do [these steps][5]

First, you use this command to generate public/private keys

``` bash
ssh-keygen -t rsa -C "your_email@youremail.com"
```

Basically, that would generate public/private keys in your home folder. if you saved the keys in your home folder that you can view your keys.

``` bash
ls ~/.ssh/
id_rsa    id_rsa.pub  known_hosts
```

file **id_rsa.pub** is your public key and **id_rsa** is your private key. Then you upload **id_rsa.pub** to Github and then you can connect to Github via SSH without having to use password every time. I think EC2 and Heroku are the same. 

Now, we all love coding what about in code? I have some example here which is in Python and I think all the languages are the same.

I use the library **rsa**. You can install it easily

``` bash
pip install rsa
```

Then you can generate the keys.

``` python
import rsa
(public_key, private_key) = rsa.new_keys(2048)
```

it might take a couple seconds to get the keys, but 2048 should be your standard by now. Now have a look at the keys

```
>>> public_key
PublicKey(29534209309072966342236728315019059662080809378008690867170941707045309003902270154173510852052110681489591796447806519430369798984624459707158855145174351259726003060555580062598516787344976412595591636803388841296208018460473115348727377101381087280966955180437218649614860816115625029885144484815954440118725591030107342156415013995103531215123098501644397412095363703762543423709714830195367078829211889094350240474706872694251558468928015513092692877035574929167783047652545773000357002867146591894383127690358099462086703188180088169904549856171296368406173474768408900722887810563868713819753518447862895139133, 65537)

>>> private_key
PrivateKey(29534209309072966342236728315019059662080809378008690867170941707045309003902270154173510852052110681489591796447806519430369798984624459707158855145174351259726003060555580062598516787344976412595591636803388841296208018460473115348727377101381087280966955180437218649614860816115625029885144484815954440118725591030107342156415013995103531215123098501644397412095363703762543423709714830195367078829211889094350240474706872694251558468928015513092692877035574929167783047652545773000357002867146591894383127690358099462086703188180088169904549856171296368406173474768408900722887810563868713819753518447862895139133, 65537, 5853484973611070995305138533710462272468493110929015451938345695299014581865001251698425812248117332832877730809474936003800499244873691306228334673248236088203321082038488631354687192743395312925586153935017130164585592135482022296788377575565542253879179407642996063900505472336632032487580151280432952533330871039500260846987279615245989379283555335473200579408998561597984286865492093479293281454202362991371489340478090036107586685417432250640745863007335226075029799578308740141059780564838880874147399808234159082348507409570253455570613403424844782542465277813808638221548094905955710788792599684368754627553, 3048836616267442645717253566428183242785699256710435915408206917831986485110304443207329137538405008020749764914855054897471943691960276026164383471359068144785145380429590398022467222960109449831417790058882587360642554647616357991607084035635835566066548855867645483820873548134124697487374239771390745052467948610194583244121, 9687042313612202470579779908557945791161444599629082668056659471372738761222623451977742705688117439787620866981353449588434275887551340654960295016278042883725967841149851338806541074750203724704414741041773527871314525574722367110086522054749464369889004170596421460710729163676852042373)
```

You can see some prime numbers. Then, I will send the **public_key** to my friend, or Github. Now my friend with encrypt the message and send it back to me.

``` python
crypto = rsa.encrypt("Encrypted_Message", public_key)
```

You will get an encrypted message, we can take a peek let&#8217;s see what&#8217;s inside

```
>>> crypto
"\x95G\x0eZ\xad\xfb-\xe1\xd3\x8a\xa5\x0e;\xf2\xa4%\xc4@\x9f\xc8\xd9\xf8\xab\x9cI8\x83A/0\x9e\\\xc4_?\xa5\x12y\x12\xcfz E\xd4{d\xe6Hk\xaa\x88\xbe\x08\xd3S\x05c\xf5\x99&\x19\x0bxHx/|\xb9\x85\x98\xa6\x8f\x7f\x13\x98/\xaed\x1a\xaaeOS(\xf2\xfcG\x19MH\xdd\xed\xdb\xe9\xdf\xd8k\x16xy\xb1\x12\x17\xfduG\xd57G\x02\xfe\x9e\x87\x02Z?\xf5\xc09,3\xd4b\x06\x11\xf1\xe2H\x7f\xa3?\xa8\x88\xef\x95\xc7\xb2\x7f\xa1y7u\xdf\x10%\xfbe*\xfd)\xae\xcb=\n\xddX:\xcd&\xca\x85i:lJ\xc8tGg\x9b\xd9\x1c;`\xe4\x873\x82\x1d\x11\xc3P\xf8z\xa4eU\xa3V\\4\x8ai\xa7\x9a\xcfY\xfd\xed\x1b\xae\xb7\xe17\x163~\x1a\xbb\x0e\xd8w3#\x83\xea4\xb68\xa1\x9b\x88T'\x9c\xa9\x9a\xbc\x1f0FP[}\r\x908\x8b\x95\xa2\xf5\xb8\x16Xi\xd5\xd0>o\xe5\x93\xabg\xa4\xe7L"
```

You can see it&#8217;s gibberish. Then my friend can send this **crpyto** back to me. And I&#8217;ll try to decrypt it.

``` python
rsa.decrypt(crypto,private_key)
'Encrypted_Message'
```

Now let&#8217;s try to decrypt the message with some other private key. You&#8217;ll get this.

``` python
>>> (newpublic_key,newprivate_key) = rsa.newkeys(2048)
>>> rsa.decrypt(crypto, newprivate_key)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/rsa/pkcs1.py", line 232, in decrypt
    raise DecryptionError('Decryption failed')
rsa.pkcs1.DecryptionError: Decryption failed
```

If you&#8217;re interested some really hardcore stuff how to hack it. I recommend he talk from 29c3 conference.

<iframe width="560" height="315" src="https://www.youtube.com/embed/N5Wn6ZBLjgU" frameborder="0" allowfullscreen></iframe>

 [1]: http://events.ccc.de/congress/2012/wiki/Main_Page "29c3"
 [2]: http://events.ccc.de/congress/2012/Fahrplan/events/5275.en.html "RSA factorisation in the real world"
 [3]: http://facthacks.cr.yp.to/ "face hacks"
 [4]: http://en.wikipedia.org/wiki/Public-key_cryptography "public key cryptography"
 [5]: https://help.github.com/articles/generating-ssh-keys "Github upload ssh keys"
