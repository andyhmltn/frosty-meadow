frosty-meadow
=============
[![Build Status](https://travis-ci.org/andyhmltn/frosty-meadow.png)](https://travis-ci.org/andyhmltn/frosty-meadow)

What is this?
----------------
This gem will generate a random name for your server, much in the way Heroku does.

How do I use it?
----------------
It's simple really!

	require 'frosty_meadow'
	
	FrostyMeadow.generate #=> sparkling frost

You can specify a custom separator easily:

	FrostyMeadow.generate(:separator => '-') #=> frosty-meadow

Custom adjectives/nouns may also be used:

	FrostyMeadow.generate(:adjectives => ["beautiful", "amazing", "awesome"], :nouns => ["world", "earth", "globe"]) #=> amazing world

If you are using this to generate server names similar to how heroku does it, then the `generate_hex_name` method will provide you with one formatted similarly:

	FrostyMeadow.generate_hex_name #=> billowing-snowflake-41aa3

You can generate a hex string like the example above (41aa3 in this case) by using (the first argument will be the length of the string required which defaults to 5):

	FrostyMeadow::Hex.generate 	   #=> fa391
	FrostyMeadow::Hex.generate(25) #=> 7c145ff861ad26a55e3ad83c1

Caching
---------------
There is a very basic caching method in place now that will stop `FrostyMeadow` reading from `data/words.json` every single time. If for whatever reason you need to skip the check for this cache and reload the file, you can pass `:skip_cache` as true into the params for `.generate`

Loading Words From External Files
----------------
Using the parameters to use a custom word list may be fine for small or dynamic purposes, but sometimes you may need to load from an external file. To do so, just pass `:from_file` as a parameter with the path of a valid JSON file in the following format:
	
	{
	   "adjectives":[
	      "beautiful",
	      "amazing",
	      "awesome"
	   ],
	   "nouns":[
	      "world",
	      "earth",
	      "globe"
	   ]
	}

For example, presuming the above JSON was in a file called something like `data/my_custom_word_list.json` the following would work:

	FrostyMeadow.generate(:from_file => 'data/my_custom_word_list.json') #=> amazing world
	FrostyMeadow.generate_hex_name(:from_file => 'data/my_custom_word_list.json') #=> awesome-globe-57c6d5

Pull requests
---------------
Pull requests are more than welcome. To test, just use rspec: `bundle exec rspec`

Credits
---------------
Credit to this great gist for the idea:
https://gist.github.com/afriggeri/1266756