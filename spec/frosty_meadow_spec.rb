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

	describe "#hex" do
		it "generates a 5 letter hexadecimal string by default" do
			string = FrostyMeadow::Hex.generate

			string.should =~ @hexadecimal_regex
			string.length.should eql 5
		end

		it "generates a hexadecimal string with the provided length" do
			FrostyMeadow::Hex.generate(1).length.should eql 1
			FrostyMeadow::Hex.generate(2).length.should eql 2
			FrostyMeadow::Hex.generate(3).length.should eql 3
			FrostyMeadow::Hex.generate(100).length.should eql 100 
		end
	end

	describe "#version" do
		it "returns an integers for MAJOR, MINOR and PATCH" do
			FrostyMeadow::Version::MAJOR.should be_a Fixnum
			FrostyMeadow::Version::MINOR.should be_a Fixnum
			FrostyMeadow::Version::PATCH.should be_a Fixnum
		end

		it "returns a full version number" do
			FrostyMeadow::Version::FULL.split('.').size.should eql 3
		end

		it "allows for a to_s method" do
			FrostyMeadow::Version.to_s.split('.').size.should eql 3
		end

		it "allows for a to_s method that is equal to the full version number" do
			FrostyMeadow::Version.to_s.should eql FrostyMeadow::Version::FULL
		end
	end
end