# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plan do
    name "MyString"
    number_of_products 1
    number_of_staffs 1
  end
end
