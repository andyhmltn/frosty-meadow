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
end