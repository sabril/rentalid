ActiveAdmin.register User do
  controller.load_and_authorize_resource
  menu :if => proc{ can?(:read, User) }, :parent => "Account Settings"
  scope :active
  scope :inactive
  scope :banned
  
  index do
    column :email
    column :name
    column :roles do |user|
      user.roles.map {|r| r.capitalize }.join(', ')
    end
    column :last_sign_in_at
    column :last_sign_in_ip
    column :status do |user|
      status_tag user.status, user.status_tag
    end
    default_actions if can?(:manage, User)
  end
  
  filter :name
  filter :email
  
  form :partial => "form"
end
