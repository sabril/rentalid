# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    account_id 1
    name "MyString"
    description "MyString"
    updated_by "MyString"
    status "Available"
  end
end
