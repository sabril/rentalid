# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    addressable_id 1
    addressable_type "MyString"
    full_address "MyText"
    city "MyString"
    state "MyString"
    zip "MyString"
    country "MyString"
    phone "MyString"
    longitude "MyString"
    latitude "MyString"
    address_type "MyString"
  end
end
