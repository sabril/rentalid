# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Create Plans"
beta = Plan.create(:name => "Beta Plan", :number_of_products => 3, :number_of_staffs => 1, :description => "This plan will be expire in 15 days.")
basic = Plan.create(:name => "Basic Plan", :number_of_products => 10, :number_of_staffs => 3, :description => "This is a Standard plan.")
plus = Plan.create(:name => "Plus Plan", :number_of_products => 30, :number_of_staffs => 10, :description => "")
premium = Plan.create(:name => "Premium Plan", :number_of_products => 100, :number_of_staffs => 30, :description => "")

puts "Generate Default rent types"
RentType.create!(:type => "Hourly", :description => "Customer will pay hourly", :updated_by => "system")
RentType.create!(:type => "Daily", :description => "Customer will pay daily", :updated_by => "system")
RentType.create!(:type => "Monthly", :description => "Customer will pay monthly", :updated_by => "system")
RentType.create!(:type => "Fixed", :description => "Customer will pay on fixed price", :updated_by => "system")


puts 'SETTING UP DEFAULT USER LOGIN'
account = Account.create! :name => "ccc", :plan_id => 4
user = account.users.create :name => 'Superman', :email => 'support@ngerental.com', :password => 'qw3rty*', :password_confirmation => 'qw3rty*', :confirmed_at => Time.now.utc
account.create_owner
user.roles = ["superman"]
user.save

puts 'New user created: ' << user.name
account2 = Account.create! :name => "app2", :plan_id => 1
user2 = account2.users.create :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please', :confirmed_at => Time.now.utc
account2.create_owner
puts 'New user created: ' << user2.name

account3 = Account.create! :name => "newby", :plan_id => 1
user3 = account3.users.create :name => 'guntur.pramono', :email => 'guntur.pramono@gmail.com', :password => '4p44j4b0l3h', :password_confirmation => '4p44j4b0l3h', :confirmed_at => Time.now.utc
account3.create_owner
puts 'New user created: ' << user3.name
# create product for sample user