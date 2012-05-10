class CreateProductsRentTypes < ActiveRecord::Migration
  def change
    create_table :products_rent_types do |t|
      t.integer :product_id
      t.integer :rent_type_id
      t.decimal :amount, :default => 0.00
      t.timestamps
    end
  end
end
