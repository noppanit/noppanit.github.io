---
layout: post
title: "Python's Monkey patch for Dummies"
date: 2015-10-25 19:00:27 -0400
comments: true
categories: 
 - Python
---

Alright, I'm going to cut to the chase here. I'm having problems with Monkey patching in Python and I want to make it clear for myself and anybody who might stumble upon my post in the future. So, what's the big deal here?

Let's say you have a model

``` python models/person.py
def get_name():
	// Doing some database lookup
	// But I'm going to return a hard-coded name for now
	return 'John Doe'
```

And you have a Phonebook class that's trying to access the database

``` python models/phonebook.py
from models.person import get_name

class Phonebook(object):

    def lookup(self):
        return get_name()
```

Now, we know that `get_name` is accessing some database and we don't want that to happen in unit test. We would like to stub that.

Coming from Java, I'd write my test like this.

``` python tests/test_phonebook.py
from unittest import TestCase, mock
from models.phonebook import Phonebook

class PhonebookTestCase(TestCase):
    
    @mock.patch('models.person.get_name')
    def test_main(self, mock_person):
        mock_person.return_value = 'Another Name'
        self.assertEqual('Another Name', Phonebook().lookup())

```

It makes sense right? I want to stub something from `models.person.get_name` so I'm telling `mock` to stub that class but my test failed miserably.

``` plain
tests/test_phonebook.py F

=================================================================================== FAILURES ===================================================================================
_________________________________________________________________________ PhonebookTestCase.test_main __________________________________________________________________________

self = <tests.test_phonebook.PhonebookTestCase testMethod=test_main>, mock_person = <MagicMock name='get_name' id='4460968592'>

    @mock.patch('models.person.get_name')
    def test_main(self, mock_person):
        mock_person.return_value = 'Another Name'
>       self.assertEqual('Another Name', Phonebook().lookup())
E       AssertionError: 'Another Name' != 'John Doe'
E       - Another Name
E       + Noppanit

```

Why? Because `patch` behaves differently than what we expected. This is explained in [Where to patch][1]. I'm going to summarize for you. Basically, `patch` is going to take effect from where it is looked up... For me after reading that I'm still confused. I might be the only one who's confused here so I'm going to continue writing. 

If we take a closer look how [import][2] behaves in Python, it would be clearer.

``` python models/phonebook.py
from models.person import get_name
```

The line says please import `get_name` to the namespace in `models/phonebook.py`. So, when we want to use it we can just called `get_name()` without having to write `models.person.get_name()` Now if you change your code to be

``` python models/phonebook.py
import models.person

class Phonebook(object):

    def lookup(self):
        return models.person.get_name()

```

You test would pass. Because now our Phonebook is looking up `models.person.get_name` namespace instead of having function `get_name` being imported to its namespace.

Now if you want the old test to work, your `patch` has to be changed to

``` python tests/test_phonebook.py

from unittest import TestCase, mock
from models.phonebook import Phonebook

class PhonebookTestCase(TestCase):
    
    @mock.patch('models.phonebook.get_name')
    def test_main(self, mock_person):
        mock_person.return_value = 'Another Name'
        self.assertEqual('Another Name', Phonebook().lookup())

```

That's it for now. If you're wondering why this is the case then looking at the source code of patch would help a lot. It's using [`__import__`][3] function.

 [1]: http://www.voidspace.org.uk/python/mock/patch.html#where-to-patch
 [2]: http://effbot.org/zone/import-confusion.htm
 [3]: https://docs.python.org/3.5/library/functions.html#__import__


