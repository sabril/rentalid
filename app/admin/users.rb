ActiveAdmin.register User do
  index do
    column :email
    column :name
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :status
    #default_actions
  end
  
  filter :name
  filter :email
end
