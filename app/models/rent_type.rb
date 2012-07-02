class RentType < ActiveRecord::Base
  #has_paper_trail
  attr_accessible :account_id, :type, :description, :updated_by
  
  has_many :products_rent_types, :dependent => :destroy
  
  def name
    self.type
  end
  
end

class Fixed < RentType
  
end

class Hour < RentType
  
end

class Day < RentType
  
end

class Month < RentType
  
end