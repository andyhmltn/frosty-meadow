require 'spec_helper'

describe FrostyMeadow do
	describe "#generate" do
		it "generates a random string" do
			FrostyMeadow.generate(:adjectives => ["hello"], :nouns => ["world"]).should eql 'hello world'
			FrostyMeadow.generate(:adjectives => ["world"], :nouns => ["hello"]).should eql 'world hello'
		end

		it "converts the generated string to an underscored version" do
			FrostyMeadow.generate(:adjectives => ["hello"], :nouns => ["world"], :separator => '_').should eql 'hello_world'
		end

		it "converts the generated string to a dashed version" do
			FrostyMeadow.generate(:adjectives => ["hello"], :nouns => ["world"], :separator => '-').should eql 'hello-world'
		end

		it "generates a two word string" do
			FrostyMeadow.generate.split.size.should eql 2
		end
	end

	describe "#hex_string" do
		it "generates a 5 letter hexadecimal string by default" do
			string = FrostyMeadow.hex_string

			string.should =~ /^[0-9A-F]+$/i
			string.length.should eql 5
		end

		it "generates a hexadecimal string with the provided length" do
			FrostyMeadow.hex_string(1).length.should eql 1
			FrostyMeadow.hex_string(2).length.should eql 2
			FrostyMeadow.hex_string(3).length.should eql 3
			FrostyMeadow.hex_string(100).length.should eql 100 
		end
	end
end