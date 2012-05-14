class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :addressable_id
      t.string :addressable_type
      t.text :full_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :longitude
      t.string :latitude
      t.string :address_type

      t.timestamps
    end
    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
