ActiveAdmin.register Account do
  controller.load_and_authorize_resource
  menu :if => proc{ current_user.is?(:superman) }, :label => "Accounts", :parent => "Account Settings"
  
  controller do
    before_filter :redirect_to_my_account, :only => [:show]
    
    def redirect_to_my_account
      redirect_to administration_my_account_path unless current_user.is?(:superman)
    end
  end
end

ActiveAdmin.register_page "My Account" do
  menu :if => proc{ current_user.is?(:owner) }, :parent => "Account Settings"
  
  action_item do
    link_to "Edit Account", edit_administration_account_path(current_user.account), :class => ""
  end
  
  content do
    render "show"
  end
end