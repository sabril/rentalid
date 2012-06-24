class Order < ActiveRecord::Base
  attr_accessible :member_id, :o_date, :total
  belongs_to :member
  
  has_many :order_details, :dependent => :destroy
end
