# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
account = Account.create! :name => "ccc"
user = User.create! :name => 'Superman', :email => 'support@ngerental.com', :password => 'qw3rty*', :password_confirmation => 'qw3rty*', :confirmed_at => Time.now.utc, :account => Account.first
user.roles = ["owner"]
user.save

puts 'New user created: ' << user.name
account2 = Account.create! :name => "app2"
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please', :confirmed_at => Time.now.utc, :account => Account.last
user2.roles = ["owner"]
user2.save
puts 'New user created: ' << user2.name
