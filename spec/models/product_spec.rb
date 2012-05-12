require 'spec_helper'

describe Product do
  before(:each) do
    @product = FactoryGirl.create(:product)
  end
  
  it "should create status tag base on status" do
     @product.status = "Available"
     @product.status_tag.should == :bs_green
     
     @product.status = "Rented"
     @product.status_tag.should == :bs_orange
     
     @product.status = "Maintenance"
     @product.status_tag.should == :bs_gray
     
     @product.status = "Not Available"
     @product.status_tag.should == :bs_red
  end
end
