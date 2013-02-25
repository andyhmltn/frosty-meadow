require File.expand_path('../../lib/frosty_meadow.rb', __FILE__) 
require 'yaml'

RSpec.configure do |config|
	# Enable colour
	config.color_enabled = true
	config.tty = true

	config.formatter = :documentation
end