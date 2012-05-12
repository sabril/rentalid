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
  
  it "should not create reserved subdomains" do
    %w{www ftp ssl mail pop smtp admin sftp}.each do |subdomain|
      @account = Account.new(:name => subdomain)
      @account.should_not be_valid
      @account.should have(1).error_on(:name)
    end
  end
  
  it "should not create existing subdomain" do
    @account = FactoryGirl.create(:account)
    @account2 = Account.new(:name => "app1")
    @account2.should_not be_valid
    @account2.should have(1).error_on(:name)
  end
end
