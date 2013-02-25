fragrant-wind
=============
[![Build Status](https://travis-ci.org/andyhmltn/fragrant-wind.png)](https://travis-ci.org/andyhmltn/fragrant-wind)

What is this?
----------------
This gem will generate a random name for your server, much in the way Heroku does.

How do I use it?
----------------
It's simple really!

	require 'fragrant_wind'
	
	FragrantWind.generate #=> sparkling frost

You can convert it to an underscored format easily:

	FragrantWind.generate(:underscored => true)

Custom adjectives/nouns may also be used:

	FragrantWind.generate(:adjectives => ["beautiful", "amazing", "awesome"], :nouns => ["world", "earth", "globe"]) #=> amazing world

Pull requests
---------------
Pull requests are more than welcome. To test, just use rspec: `bundle exec rspec`

Credits
---------------
Credit to this great gist for the idea:
https://gist.github.com/afriggeri/1266756