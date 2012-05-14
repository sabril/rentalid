ActiveAdmin.register Account do
  controller.authorize_resource
  menu :if => proc{ current_user.is?(:superman) }, :label => "Accounts", :parent => "Account Settings"
end

ActiveAdmin.register_page "My Account" do
  menu :if => proc{ current_user.is?(:owner) }, :parent => "Account Settings"
  
  action_item do
    link_to "Edit Account", edit_administration_account_path(current_user.account), :class => ""
  end
  
  content do
    panel "Account Details" do
      attributes_table_for current_user.account do
        row(:name)
      end
    end
    
    panel "Address" do
      if current_user.account.address
        attributes_table_for current_user.account.address do
          row(:full_address) 
        end
      else
        div do
          "No address"
        end
      end
    end
  end
end