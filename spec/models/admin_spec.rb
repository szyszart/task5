require 'spec_helper'

describe Admin do
	before(:each) do
		@attr = {
			:name => "Rspec test admin",
			:email => "admin@rulez.net",
			:password => "blahblah",
			:password_confirmation => "blahblah"
		}
	end

	it "should create a new admin" do
		Admin.create!(@attr)
	end
  
	describe "password validations" do
		it "should require a password" do
			Admin.new(@attr.merge(:password => "", :password_confirmation => "")).
			should_not be_valid
    		end

    		it "should require a matching password confirmation" do
			Admin.new(@attr.merge(:password_confirmation => "invalid")).
			should_not be_valid
		end

	end
end

