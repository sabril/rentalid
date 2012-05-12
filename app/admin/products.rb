ActiveAdmin.register Product do
  controller.authorize_resource
  menu :if => proc{ can?(:read, Product) }
  scope :available
  scope :rented
  scope :repaired
  scope :not_available
  
  filter :name
  filter :description
  
  form :partial => "form"
  
  index do
    column :name
    column :status do |product|
      status_tag product.status, product.status_tag
    end
    default_actions if can?(:manage, Product)
  end
end