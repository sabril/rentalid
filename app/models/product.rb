class Product < ActiveRecord::Base
  attr_accessible :account_id, :description, :name, :properites, :updated_by, :status, :products_rent_types_attributes
  acts_as_tenant(:account)
  
  has_many :products_rent_types, :dependent => :destroy
  accepts_nested_attributes_for :products_rent_types
  
  %w{car_type car_number}.each do |key|
    attr_accessible key
    scope "has_#{key}", lambda { |value| where("properties @> (? => ?)", key, value) }

    define_method(key) do
      properties && properties[key]
    end

    define_method("#{key}=") do |value|
      self.properties = (properties || {}).merge(key => value)
    end
  end
  
  STATUSES = %w{Available Rented Maintenance Not\ Available}
  
  STATUS_AVAILABLE = 'Available'
  STATUS_RENTED = 'Rented'
  STATUS_REPAIRED  = 'Maintenance'
  STATUS_NOT_AVAILABLE = "Not Available"
  
  scope :available, where(:status => STATUS_AVAILABLE)
  scope :rented, where(:status => STATUS_RENTED)
  scope :repaired, where(:status => STATUS_REPAIRED)
  scope :not_available, where(:status => STATUS_NOT_AVAILABLE)
  
  def status_tag
    case self.status
      when STATUS_AVAILABLE then :bs_green
      when STATUS_RENTED then :bs_orange
      when STATUS_REPAIRED then :bs_gray
      when STATUS_NOT_AVAILABLE then :bs_red
    end
  end
end
