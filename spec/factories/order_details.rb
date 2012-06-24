# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_detail do
    order_id 1
    products_rent_type_id 1
    quantity 1
    amount 1.5
  end
end
