### UTILITY METHODS ###

def create_visitor
  # @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
  #   :password => "please", :password_confirmation => "please", :account_name => "app1"}
    
  @visitor ||= FactoryGirl.attributes_for(:user)
end

def find_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def assign_default_subdomain
  Capybara.default_host = "http://www.#{SITE_URL}"
end

def create_user
  create_visitor
  delete_user
  @account = FactoryGirl.create(:account, :users_attributes => [@visitor])
  @account.create_owner
  Capybara.default_host = "http://#{@account.name}.#{SITE_URL}"
end

def create_banned_user
  create_visitor
  delete_user
  @visitor[:status] = "Banned"
  @account = FactoryGirl.create(:account, :users_attributes => [@visitor])
  @account.create_owner
  Capybara.default_host = "http://#{@account.name}.#{SITE_URL}"
end

def create_superman_user
  create_visitor
  delete_user
  @account = FactoryGirl.create(:account, :name => "ccc", :users_attributes => [FactoryGirl.attributes_for(:superman)])
  @account.create_owner
  Capybara.default_host = "http://#{@account.name}.#{SITE_URL}"
end

def delete_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  assign_default_subdomain
  visit '/accounts/new'
  fill_in "Name", :with => @visitor[:name]
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  fill_in "Confirm", :with => @visitor[:password_confirmation]
  fill_in "URL", :with => Faker::Name.last_name.downcase
  click_button "Register"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I exist as a banned user$/ do
  create_banned_user 
end

Then /^I see an inactive login message$/ do
  page.should have_content "That user is no longer active."
end


Given /^I logged in as a superman user$/ do
  create_superman_user
  sign_in
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "please123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "Name", :with => "newname"
  fill_in "Current password", :with => @visitor[:password]
  click_button "Update"
end

When /^I look at the list of users$/ do
  visit '/'
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "You will receive an email with information to access your account."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Users email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Users password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Users password doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Users password doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  #pending "different user show"
  # create_user
  page.should have_content "Rental"
end

Then /^show me the page$/ do
  save_and_open_page
end

When /^I go to the owner page$/ do
  visit user_path(@account.owner) # express the regexp above with the code you wish you had
end

When /^I go to the new account page$/ do
  visit '/accounts/new' # express the regexp above with the code you wish you had
end

Then /^I should be redirected to root page$/ do
  page.should have_content "Logout" # express the regexp above with the code you wish you had
end
