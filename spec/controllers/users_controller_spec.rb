require 'spec_helper'

describe UsersController do

  before (:each) do
    @account = FactoryGirl.create(:account)
    @request.host = "#{@account.name}.localdev.com"
    @user = FactoryGirl.create(:user, :account => Account.first)
    sign_in @user
  end

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @user.id
      assigns(:current_account).should == @account
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
    
=begin
    it "should reject if user status is banned or inactive" do
      sign_out(:user)
      @user2 = FactoryGirl.create(:user, :account => Account.first, :status => User::STATUS_INACTIVE, :email => "user2@example.com")
      @user2.status.should == "InActive"
      sign_in @user2
      assigns(:current_account).should == nil
      response.should be_redirect
      
      @user3 = FactoryGirl.create(:user, :account => Account.first, :status => User::STATUS_BANNED, :email => "user3@example.com")
      @user3.status.should == "Banned"
    end
=end

    
  end
  


end
