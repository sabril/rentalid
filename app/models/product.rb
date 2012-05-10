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
  
  STATUSES = %w{OK Maintenance Broken}
  
  STATUS_OK = 'OK'
  STATUS_REPAIRED  = 'Maintenance'
  STATUS_BROKEN = "Broken"
  
  scope :ok, where(:status => STATUS_OK)
  scope :repaired, where(:status => STATUS_REPAIRED)
  scope :broken, where(:status => STATUS_BROKEN)
  
  def status_tag
    case self.status
      when STATUS_OK then :bs_green
      when STATUS_REPAIRED then :bs_gray
      when STATUS_BROKEN then :bs_red
    end
  end
end
