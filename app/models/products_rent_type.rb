class ProductsRentType < ActiveRecord::Base
  attr_accessible :product_id, :rent_type_id, :amount
  
  belongs_to :product
  belongs_to :rent_type
  
  has_many :order_details, :dependent => :destroy
end
