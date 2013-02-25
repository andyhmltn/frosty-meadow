require 'spec_helper'

describe FragrantWind do
	before :each do
		@fragrantwind = FragrantWind.new
		@words = ["hello", "world"]
	end

	describe "#new" do
		it "returns a FragrantWind object" do
			@fragrantwind.should be_an_instance_of FragrantWind
		end

		it "allows for custom adjectives and nouns" do			
			@fragrantwind = FragrantWind.new @words, @words
			@fragrantwind.adjectives.should =~ @words
			@fragrantwind.nouns.should =~ @words
		end
	end

	describe "#generate" do
		it "generates a random string" do
			@fragrantwind = FragrantWind.new ["hello"], ["world"]
			@fragrantwind.generate.should eql 'hello world'

			@fragrantwind = FragrantWind.new ["world"], ["hello"]
			@fragrantwind.generate.should eql 'world hello'
		end

		it "converts the generated string to an underscored version" do
			@fragrantwind = FragrantWind.new ["hello"], ["world"]

			@fragrantwind.generate(:to_underscored => true).should eql 'hello_world'
		end

		it "generates a two word string" do
			@fragrantwind.generate.split.size.should eql 2
		end
	end
end