ActiveAdmin.register Product do
  menu :if => proc{ can?(:read, Product) }
  scope :ok
  scope :repaired
  scope :broken
  
  filter :name
  filter :description
  
  form :partial => "form"
  
  index do
    column :name
    # column "Account" do |product|
    #   product.account.name
    # end
    column :status do |product|
      status_tag product.status, product.status_tag
    end
    default_actions if can?(:manage, Product)
  end
end
