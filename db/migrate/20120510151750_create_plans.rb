class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.integer :number_of_products
      t.integer :number_of_staffs

      t.timestamps
    end
  end
end
