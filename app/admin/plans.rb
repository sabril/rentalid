ActiveAdmin.register Plan do
  controller.load_and_authorize_resource
  menu :if => proc{ current_user.is?(:superman) }, :parent => "Settings"
end
