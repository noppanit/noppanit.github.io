---
title: 'How to : Google Translate API with Perl'
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 232497796
categories:
  - Knowledges
---
So, without boring introduction. 

But you need to install some library for Perl as well by using cpan.

``` bash
cpan install JSON
cpan install REST::Client
```

``` perl
#!/usr/bin/perl

use REST::Client;
use JSON;
use HTML::Entities qw(decode_entities);

while (1) 
{
	print "Please enter English word: ";
	chop ( $_ = );

	my $client = REST::Client->new();
	$client->GET("https://www.googleapis.com/language/translate/v2?key=AIzaSyACJybEm6lyelnYHZzXfydtk-V6-Uz48bQ&en&target=fr&q=$_");
	$response = $client->responseContent();

	$json_text = from_json( $response );

	foreach my $french(@{$json_text->{data}->{translations}})
	{
		my %ep_hash = ();
		$ep_hash{translatedText} = "Translated to French: $french->{translatedText}";

# print french
		while (my($key, $value) = each (%ep_hash))
		{
			print decode_entities($value);
		}
	}
	print "\n";
}
```
