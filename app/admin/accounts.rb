ActiveAdmin.register Account do
  controller.authorize_resource
  menu :if => proc{ current_user.is?(:superman) }, :label => "Accounts"
end
