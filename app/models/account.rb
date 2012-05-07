class Account < ActiveRecord::Base
  attr_accessible :name
  
  validates  :name, :presence   => true, :uniqueness => true, :subdomain  => true
  
  has_many :users, :dependent => :destroy
  has_one :owner, :class_name => "User"
  
  attr_accessible :name, :users_attributes
  
  accepts_nested_attributes_for :users
end
