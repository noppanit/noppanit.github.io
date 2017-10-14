---
layout: post
title: "How I learn to love awk"
date: 2017-10-14 10:24:39 -0400
comments: true
categories: awk, shell, performance
---

## Problem statement

I'm writing a Jenkins job to produce a file with a list of canonical urls from two separate sources. One source looks like this

``` text

File brand_urls

"url1","brand"
"url2","brand"
"url3","brand1"

```

The second looks like this

``` text

File url.json after manipulation using jq

The source looks like this

[{
  slug: "brand",
  ...,
  domain: {
    production: 'www.domain.com'
  }
 }, {
  slug: "brand1",
  ...,
  domain: {
    production: 'www.domain1.com'
}]

# echo $BRAND_JSON | jq -r '.[] | [.domain.production,.slug] | @csv' >> slug.json

"domain","brand"
"doamin1","brand1"

```

What I want is

``` text

"domain/url1"
"domain/url2"
"domain1/url3"

```

Basically, I want to join two files together by `brand` which I could have done that in SQL.

So my initial thought would be something like this

``` bash

BRAND_JSON=$(curl url.json) 

while IFS= read -r line
do
  BRAND=$(echo $line | awk -F',' '{print $2}' | sed "s/\"//g")
  URI=$(echo $line | awk -F',' '{print $1}' | sed "s/\"//g")
  echo $BRAND
  DOMAIN=$(echo $BRAND_JSON | jq -r ".[] | select(.slug==\"$BRAND\") | .domain.production")
  echo $DOMAIN
  echo $URI
  echo "https://$DOMAIN/$URI" >> urls
done < "brand_urls"

```

This is way too slow because I have about 900k of urls to filter and every url will do a O(n) search. Also, I created a lot of sub-shells

And I thought hmm if I can make that a constant operation using some kind of Map then it would be a lot faster. I immediately thought of Map or associative array but my shell doesn't have associative just yet. People might wonder why can't I just use python or node script to manipulate that. I could have but I just want a script to run in Jenkins and bash is available already. I don't have to install any runtime. 

## Awk to the rescue
Awk already has associate array!

Here's my updated version of the code

``` bash

INPUTFILE="slug.json"
DATAFILE="brand_urls"
OUTFILE="all_urls"

awk 'BEGIN {
  # mapping brand.json
  while (getline < "'"$INPUTFILE"'")
  {
    split($0,ft,",");
    domain=ft[1];
    gsub(/"/, "", domain);
    slug=ft[2];
    gsub(/"/, "", slug);
    key=slug;
    data=domain;
    domainMap[key]=data;
  }
  close("'"$INPUTFILE"'");
  while (getline < "'"$DATAFILE"'")
    {
      split($0,ft,",");
      uri=ft[1];
      gsub(/"/, "", uri);
      slug=ft[2];
      gsub(/"/, "", slug);
      domain=domainMap[slug]; 
      printf "https://%s/%s\n", domain, uri > "'"$OUTFILE"'";
    }
}'

```

I copied the script from [here](https://magvar.wordpress.com/2011/05/18/awking-it-how-to-load-a-file-into-an-array-in-awk/)

