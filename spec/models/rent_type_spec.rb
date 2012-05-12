require 'spec_helper'

describe RentType do
  before(:each) do
    @rent_type = FactoryGirl.create(:rent_type)
  end
  
  it "should create a new instance given a valid attribute" do
    @rent_type.name.should == "Hourly"
  end
end
