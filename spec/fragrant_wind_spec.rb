require 'spec_helper'

describe FragrantWind do
	before :each do
		@fragrantwind = FragrantWind.new
	end

	describe "#new" do
		it "returns a FragrantWind object" do
			@fragrantwind.should be_an_instance_of FragrantWind
		end
	end
end