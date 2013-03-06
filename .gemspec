require File.expand_path('../lib/frosty_meadow.rb', __FILE__) 

Gem::Specification.new do |s|
  s.name        = 'frosty_meadow'
  s.version     = FrostyMeadow::Version.to_s 
  s.summary     = "Random server name generator!"
  s.description = "This gem will generate a random name for your server, much in the way Heroku does."
  s.authors     = ["Andy Hamilton"]
  s.email       = 'andyhmltn@gmail.com'
  s.files       = ["lib/frosty_meadow.rb", "lib/data/words.json"]
  s.homepage    = 'https://github.com/andyhmltn/frosty-meadow'
end
