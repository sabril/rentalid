require 'spec_helper'

describe Account do
  before(:each) do
    @attr = { 
      :name => "Example"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Account.create!(@attr)
  end
end
