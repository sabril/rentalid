class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :account_id
      t.string :email
      t.string :name
      t.string :provider
      t.string :uid
      t.string :status
      t.timestamps
    end
  end
end
