require 'spec_helper'

describe FragrantWind do
	describe "#generate" do
		it "generates a random string" do
			FragrantWind.generate(:adjectives => ["hello"], :nouns => ["world"]).should eql 'hello world'
			FragrantWind.generate(:adjectives => ["world"], :nouns => ["hello"]).should eql 'world hello'
		end

		it "converts the generated string to an underscored version" do
			FragrantWind.generate(:adjectives => ["hello"], :nouns => ["world"], :underscored => true).should eql 'hello_world'
		end

		it "generates a two word string" do
			FragrantWind.generate.split.size.should eql 2
		end
	end
end