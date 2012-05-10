class ProductsRentType < ActiveRecord::Base
  attr_accessible :product_id, :rent_type_id, :amount
  
  belongs_to :product
  belongs_to :rent_type
end
