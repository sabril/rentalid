class Account < ActiveRecord::Base
  #has_paper_trail
  attr_accessible :name, :plan_id, :logo, :time_zone
  
  validates  :name, :presence   => true, :uniqueness => true, :subdomain  => true
  
  # relationships
  belongs_to :plan
  
  has_one :address, :as => :addressable, :dependent => :destroy
  
  has_many :users, :dependent => :destroy
  has_many :products, :dependent => :destroy
  has_many :members
  
  # white list attributes
  attr_accessible :name, :users_attributes, :time_zone
  
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :address
  
  # callbacks
  after_create :create_settings_data
  
  mount_uploader :logo, LogoUploader
  
  def create_settings_data
    # generate default data when creating new account
    self.products.create(:name => "Sample", :products_rent_types_attributes => [{ :amount => 1000.00, :rent_type_id => 1 }, { :amount => 10.00, :rent_type_id => 2 }, { :amount => 100.00, :rent_type_id => 3 }, { :amount => 1000.00, :rent_type_id => 4 }])
  end
  
  def owner
    self.users.with_role(:owner).first
  end
  
  def create_owner
    if self.users.first
      @owner = self.users.first
      @owner.roles = ["owner"]
      @owner.save
    end
  end
  
end