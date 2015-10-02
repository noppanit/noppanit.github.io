---
title: 'Ruby: Find unscrambled words from a list of scrambled words'
comments: true
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

``` ruby
scrambled_words = File.new("words.txt","r")
while (scrambled_word = scrambled_words.gets )

  scrambled_word = "#{scrambled_word}"
  scrambled_word_array = scrambled_word.split(//)
  
  scrambled_word_hash = Hash.new()

  for word in scrambled_word_array
    if( word != "\r" && word != "\n")
      scrambled_word_hash[word] += 1
    end
  end

  word_list = File.new("wordlist.txt","r")
  while (words = word_list.gets)

      unscrambled_word = "#{words}"
      unscrambled_word_array = unscrambled_word.split(//)

      unscrambled_word_hash = Hash.new()
      
      for word1 in unscrambled_word_array
        if( word1 != "\r" && word1 != "\n")
          unscrambled_word_hash[word1] += 1
        end
      end

    if scrambled_word_hash == unscrambled_word_hash
      print "#{words},"
    end
  end
  word_list.close
end


scrambled_words.close
```

You can get wordlist.txt from <http://www.hackthissite.org/missions/prog/1/> as well. It&#8217;s really fun.
