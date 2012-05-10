ActiveAdmin.register Plan do
  controller.authorize_resource
  menu :if => proc{ current_user.is?(:superman) }, :parent => "Settings"
end
