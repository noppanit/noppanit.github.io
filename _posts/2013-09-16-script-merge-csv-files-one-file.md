---
title: Script to merge all csv files to one file.
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 1767509362
categories:
  - Knowledges
tags:
  - csv
  - merge
---
For example I have file structure like this.

```
├── 2013-01  
│   ├── 2013-01-avon-and-somerset-street.csv  
├── 2013-02  
│   ├── 2013-02-avon-and-somerset-street.csv  
├── 2013-03  
│   ├── 2013-03-avon-and-somerset-street.csv  
├── 2013-04  
│   ├── 2013-04-avon-and-somerset-street.csv  
├── 2013-05  
│   ├── 2013-05-avon-and-somerset-street.csv  
├── 2013-06  
│   ├── 2013-06-avon-and-somerset-street.csv  
└── 2013-07  
├── 2013-07-avon-and-somerset-street.csv
```

To process multiple files in R or Pandas would be a pain, if I could combine all the csv in every folder into one file and I can work on just that one file. 

How to use it&#8217;s really easy. Just copy the source code and paste in anywhere. For example, I would call this **merge_csv</code>. Then you would execute like this.</p> 

``` bash
sh merge_csv <FOLDER_YOU_WANT>
```

The script will iterate to every folder and sub-folder.


**Update**  
I also got this from my friend, which is much shorted. I really need to improve my shell script.

<blockquote class="twitter-tweet">
  <p>
    <a href="https://twitter.com/noppanit">@noppanit</a> or 'find . -name *.csv -exec cat {} \; > conjoined.csv'
  </p>
  
  <p>
    &mdash; Nathan Fisher (@natbobc) <a href="https://twitter.com/natbobc/statuses/379745266410471424">September 16, 2013</a>
  </p>
</blockquote>
