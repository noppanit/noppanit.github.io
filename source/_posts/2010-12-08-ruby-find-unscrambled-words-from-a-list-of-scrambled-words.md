---
title: 'Ruby: Find unscrambled words from a list of scrambled words'
author: Noppanit Charassinvichai
layout: post
permalink: /ruby-find-unscrambled-words-from-a-list-of-scrambled-words/
dsq_thread_id:
  - 187144660
categories:
  - Ruby
---
Suppose you have a list of words, and you have another list of unscrambled words. How would you find unscrambled words in the list of words. For example, you have a list of words:

1. testtest  
2. apple  
3. college  
4. abcdefg  
5. school  
&#8230; and a lot more, says 1000 words

And a list of unscrambled words  
1. hoolsc  
2. bgfedcba  
3. ppale

How would you know that the exact word of the list of unscrambled words? How would you know that &#8220;hoolsc&#8221; is &#8220;school&#8221;.

Here is what I do, I use Ruby to create a hash and find the frequency of each character of each word. And compare the two hashs to see if they contain the same amount of characters. This might not be the most efficient way to do that, but it certainly the easiest way to do. 

For instance, &#8220;school&#8221; would have { &#8220;s&#8221; => 1, &#8220;c&#8221; => 1, &#8220;h&#8221; => 1, &#8220;o&#8221; => 2, &#8220;l&#8221; => 1} and &#8220;hoolsc&#8221; would be {&#8220;h&#8221; => 1, &#8220;o&#8221; => 2, &#8220;l&#8221; => 1, &#8220;s&#8221; => 1, &#8220;c&#8221; => 1}. They are different in the position of key, but they have the same number of keys and each key-value pair is equal to the element in the other hash. 

Here is the code I created  
The words.txt is the list of scrambled words  
and the wordlist.txt is the list of unscrambled words

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />33<br />34<br />35<br />36<br />37<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          scrambled_words = <span class="kw4">File</span>.<span class="me1">new</span><span class="br0">&#40;</span><span class="st0">"words.txt"</span>,<span class="st0">"r"</span><span class="br0">&#41;</span><br /> <span class="kw1">while</span> <span class="br0">&#40;</span>scrambled_word = scrambled_words.<span class="kw3">gets</span> <span class="br0">&#41;</span><br /> <br /> &nbsp; scrambled_word = <span class="st0">"#{scrambled_word}"</span><br /> &nbsp; scrambled_word_array = scrambled_word.<span class="kw3">split</span><span class="br0">&#40;</span><span class="sy0">//</span><span class="br0">&#41;</span><br /> &nbsp; <br /> &nbsp; scrambled_word_hash = <span class="kw4">Hash</span>.<span class="me1">new</span><span class="br0">&#40;</span><span class="nu0"></span><span class="br0">&#41;</span><br /> <br /> &nbsp; <span class="kw1">for</span> word <span class="kw1">in</span> scrambled_word_array<br /> &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span> word != <span class="st0">"<span class="es0">\r</span>"</span> <span class="sy0">&&</span> word != <span class="st0">"<span class="es0">\n</span>"</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; scrambled_word_hash<span class="br0">&#91;</span>word<span class="br0">&#93;</span> <span class="sy0">+</span>= <span class="nu0">1</span><br /> &nbsp; &nbsp; <span class="kw1">end</span><br /> &nbsp; <span class="kw1">end</span><br /> <br /> &nbsp; word_list = <span class="kw4">File</span>.<span class="me1">new</span><span class="br0">&#40;</span><span class="st0">"wordlist.txt"</span>,<span class="st0">"r"</span><span class="br0">&#41;</span><br /> &nbsp; <span class="kw1">while</span> <span class="br0">&#40;</span>words = word_list.<span class="kw3">gets</span><span class="br0">&#41;</span><br /> <br /> &nbsp; &nbsp; &nbsp; unscrambled_word = <span class="st0">"#{words}"</span><br /> &nbsp; &nbsp; &nbsp; unscrambled_word_array = unscrambled_word.<span class="kw3">split</span><span class="br0">&#40;</span><span class="sy0">//</span><span class="br0">&#41;</span><br /> <br /> &nbsp; &nbsp; &nbsp; unscrambled_word_hash = <span class="kw4">Hash</span>.<span class="me1">new</span><span class="br0">&#40;</span><span class="nu0"></span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; <br /> &nbsp; &nbsp; &nbsp; <span class="kw1">for</span> word1 <span class="kw1">in</span> unscrambled_word_array<br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span> word1 != <span class="st0">"<span class="es0">\r</span>"</span> <span class="sy0">&&</span> word1 != <span class="st0">"<span class="es0">\n</span>"</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unscrambled_word_hash<span class="br0">&#91;</span>word1<span class="br0">&#93;</span> <span class="sy0">+</span>= <span class="nu0">1</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">end</span><br /> &nbsp; &nbsp; &nbsp; <span class="kw1">end</span><br /> <br /> &nbsp; &nbsp; <span class="kw1">if</span> scrambled_word_hash == unscrambled_word_hash<br /> &nbsp; &nbsp; &nbsp; <span class="kw3">print</span> <span class="st0">"#{words},"</span><br /> &nbsp; &nbsp; <span class="kw1">end</span><br /> &nbsp; <span class="kw1">end</span><br /> &nbsp; word_list.<span class="me1">close</span><br /> <span class="kw1">end</span><br /> <br /> <br /> scrambled_words.<span class="me1">close</span>
        </div>
      </td>
    </tr>
  </table>
</div>

You can get wordlist.txt from <http://www.hackthissite.org/missions/prog/1/> as well. It&#8217;s really fun.