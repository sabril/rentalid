class OrderDetail < ActiveRecord::Base
  attr_accessible :amount, :order_id, :products_rent_type_id, :quantity
  belongs_to :order
  belongs_to :products_rent_type
end
