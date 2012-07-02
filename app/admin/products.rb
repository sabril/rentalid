ActiveAdmin.register Product do
  controller do
    load_and_authorize_resource :except => :index
    def scoped_collection
      end_of_association_chain.accessible_by(current_ability)
    end
  end
  
  menu :if => proc{ can?(:read, Product) }
  scope :available
  scope :rented
  scope :repaired
  scope :not_available
  
  filter :name
  filter :description
  
  form :partial => "form"
  
  index do
    selectable_column
    column :name
    column :status do |product|
      status_tag product.status, product.status_tag
    end
    default_actions if can?(:manage, Product)
  end
end
