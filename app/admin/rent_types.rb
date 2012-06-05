ActiveAdmin.register RentType do
  controller do
    load_and_authorize_resource :except => :index
    def scoped_collection
      end_of_association_chain.accessible_by(current_ability)
    end
  end
  menu :if => proc{ current_user.is?(:superman) }, :parent => "Settings"
end
