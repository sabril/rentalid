require 'spec_helper'

describe AccountsController do

  before (:each) do
    
  end

  describe "GET 'new'" do
    it "should redirect if there is an active session" do
      @account ||= FactoryGirl.create(:account)
      @user ||= FactoryGirl.create(:user, :account => Account.first)
      @request.host = "#{@account.name}.localdev.com"
      sign_in @user
      get :new
      response.should be_redirect
    end
    
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have one nested user" do
      get :new
      assigns(:account).users.size.should == 1
    end
    
  end
  
  describe "POST 'create'" do
    
  end
end
