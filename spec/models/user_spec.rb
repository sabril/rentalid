require 'spec_helper'

describe User do
  
  before(:each) do
    @account = FactoryGirl.create(:account)
    @attr = { 
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar",
      :roles => ["owner"]
    }
    
    @user = User.new(@attr)
    @user.account = @account
    @user.save
    @account.create_owner
  end
  
  it "should create a new instance given a valid attribute" do
    user = User.new(@attr)
    user.account = @account
    user.save
    user.should_not be_nil
  end
  
  it "should have owner roles" do
    @user.roles.should == ["owner"]
    @user.is?("owner").should be_true
  end
  
  it "should create status tag base on status" do 
    @user.status = "Active"
    @user.status_tag.should == :bs_green
    
    @user.status = "InActive"
    @user.status_tag.should == :bs_gray
    
    @user.status = "Banned"
    @user.status_tag.should == :bs_red
    
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    #User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    user = User.new(@attr.merge(:email => upcased_email))
    user.account = @account
    user.save
    #User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "abilities" do
    subject { ability }
    let(:ability){ Ability.new(user) }

    context "when is a superman" do
      let(:user){ FactoryGirl.create(:superman) }

      it{ should be_able_to(:manage, Account.new) }
    end
    
    context "when is an account owner" do
      let(:user){ FactoryGirl.create(:user) }

      it{ should be_able_to(:destroy, User.new) }
    end
  end
  
  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
  end
  
  describe "password encryption" do
    
    before(:each) do
      #@user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

end