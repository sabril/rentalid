class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :account_id
      t.string :name
      t.string :description
      t.string :status, :default => "OK"
      t.hstore :properties
      t.string :updated_by

      t.timestamps
    end
  end
end
