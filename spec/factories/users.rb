# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email Faker::Internet.email
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
    status "Active"
    roles ["owner"]
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :superman, :class => "User" do
    name 'Test User'
    email 'support@example.com'
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
    roles ["superman"]
    status "Active"
  end
end