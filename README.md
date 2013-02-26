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

You can specify a custom seperator easily:

	FrostyMeadow.generate(:separator => '-') #=> frosty-meadow

Custom adjectives/nouns may also be used:

	FrostyMeadow.generate(:adjectives => ["beautiful", "amazing", "awesome"], :nouns => ["world", "earth", "globe"]) #=> amazing world

Pull requests
---------------
Pull requests are more than welcome. To test, just use rspec: `bundle exec rspec`

Credits
---------------
Credit to this great gist for the idea:
https://gist.github.com/afriggeri/1266756