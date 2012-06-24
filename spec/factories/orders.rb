# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    member_id 1
    o_date "2012-06-24"
    total 1.5
  end
end
