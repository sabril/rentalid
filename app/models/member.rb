class Member < ActiveRecord::Base
  devise :omniauthable
  attr_accessible :name, :email, :uid, :provider
  has_many :orders
end
