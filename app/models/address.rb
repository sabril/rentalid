class Address < ActiveRecord::Base
  attr_accessible :address_type, :addressable_id, :addressable_type, :city, :country, :full_address, :latitude, :longitude, :phone, :state, :zip
  belongs_to :addressable, :polymorphic => true
  
  belongs_to :account
  
  validates :full_address, :presence => true
end
