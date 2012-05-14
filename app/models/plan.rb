class Plan < ActiveRecord::Base
  #has_paper_trail
  attr_accessible :name, :number_of_products, :number_of_staffs, :description
  
  has_many :accounts
end
