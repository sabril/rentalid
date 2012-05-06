# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please', :confirmed_at => Time.now.utc
account = Account.create! :name => "app1"
account.owner_id = user.id
account.save
user.roles = ["owner"]
user.account = account
user.save

puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please', :confirmed_at => Time.now.utc
account2 = Account.create! :name => "app2"
account2.owner_id = user2.id
account2.save
user2.roles = ["owner"]
user2.account = account2
user2.save
puts 'New user created: ' << user2.name
