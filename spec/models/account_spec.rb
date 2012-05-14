require 'spec_helper'

describe Account do
  before(:each) do
    @attr = { 
      :name => Faker::Name.first_name
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
    @account = Account.create!(@attr)
    @account2 = Account.new(:name => @attr[:name])
    @account2.should_not be_valid
    @account2.should have(1).error_on(:name)
  end
end
