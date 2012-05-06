class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :account_id, :integer
    add_column :users, :status, :string, :default => "Active"
    add_column :users, :roles_mask, :integer
  end
end
