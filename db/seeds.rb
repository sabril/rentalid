# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Generate Default rent types"
RentType.create!(:type => "Fixed", :description => "Customer will pay on fixed price", :updated_by => "system")
RentType.create!(:type => "Hourly", :description => "Customer will pay hourly", :updated_by => "system")
RentType.create!(:type => "Daily", :description => "Customer will pay daily", :updated_by => "system")
RentType.create!(:type => "Monthly", :description => "Customer will pay monthly", :updated_by => "system")


puts 'SETTING UP DEFAULT USER LOGIN'
account = Account.create! :name => "ccc"
user = account.users.create :name => 'Superman', :email => 'support@ngerental.com', :password => 'qw3rty*', :password_confirmation => 'qw3rty*', :confirmed_at => Time.now.utc#, :account => Account.first
account.create_owner

puts 'New user created: ' << user.name
account2 = Account.create! :name => "app2"
user2 = account2.users.create :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please', :confirmed_at => Time.now.utc#, :account => Account.last
account2.create_owner
puts 'New user created: ' << user2.name


# create product for sample user