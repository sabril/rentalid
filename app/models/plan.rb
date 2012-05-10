class Plan < ActiveRecord::Base
  attr_accessible :name, :number_of_products, :number_of_staffs, :description
  
  has_many :accounts
end
