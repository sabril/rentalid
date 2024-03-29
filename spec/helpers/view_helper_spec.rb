require 'spec_helper'
include ViewHelper


describe ViewHelper do
  describe "convert past time to word" do
    it "should show correct day" do
      past_time(1.days.ago).should == "1 day ago"
    end
    
    it "should show correct days" do
      past_time(2.days.ago).should == "2 days ago"
    end
    
    it "should show correct hour" do
      past_time(1.hours.ago).should == "about 1 hour ago"
    end
    
    it "should show correct hours" do
      past_time(2.hours.ago).should == "about 2 hours ago"
    end
  end
  
  describe "show correct title" do
    it "should show ngerental.com if there is no subdomain account" do
      brand_title.should == "ngerental.com"
    end
    
    it "should show account name if there is subdomain account" do
      @current_account = FactoryGirl.create(:account)
      brand_title.should == @current_account.name
    end
  end
end