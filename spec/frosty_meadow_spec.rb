require 'spec_helper'

describe FrostyMeadow do

	before :each do
		@hexadecimal_regex  = /^[0-9A-F]+$/i
		@hexadecimal_random = FrostyMeadow.generate_hex_name 
		@hello_world_random = ["hello world", "world world", "world hello", "hello hello"]

		@options = {:adjectives => ["hello"], :nouns => ["world"]}
	end

	describe "#generate" do
		it "generates a random string" do
			@hello_world_random.should include FrostyMeadow.generate(:nouns => ["hello", "world"], :adjectives => ["hello","world"])
		end

		it "converts the generated string to an underscored version" do
			FrostyMeadow.generate(@options.merge({:separator => '_'})).should eql 'hello_world'
		end

		it "converts the generated string to a dashed version" do
			FrostyMeadow.generate(@options.merge({:separator => '-'})).should eql 'hello-world'
		end

		it "generates a two word string" do
			FrostyMeadow.generate.split.size.should eql 2
		end
	end

	describe "#generate_hex_name" do
		it "should generate a string consisting of 3 strings seperated by dashes" do
			@hexadecimal_random.split('-').size.should eql 3
		end

		it "generates a dashed string where the last word is hexadecimal" do
			@hexadecimal_random.split('-').last.should =~ @hexadecimal_regex
		end

		it "generates a dashed string where the last word is 5 characters long" do
			@hexadecimal_random.split('-').last.length.should eql 5
		end
	end

	describe "#hex_string" do
		it "generates a 5 letter hexadecimal string by default" do
			string = FrostyMeadow.hex_string

			string.should =~ @hexadecimal_regex
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