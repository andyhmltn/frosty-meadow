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

Pull requests
---------------
Pull requests are more than welcome. To test, just use rspec: `bundle exec rspec`

Credits
---------------
Credit to this great gist for the idea:
https://gist.github.com/afriggeri/1266756