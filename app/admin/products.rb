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
    column "Last Updated by" do |product|
      product.updated_by
    end
    default_actions if can?(:manage, Product)
  end
  
  controller do
    after_filter :add_updated_by, :only => [:create, :update]
    def add_updated_by
      @product.update_attributes(:updated_by => current_user.email)
    end
  end
end
