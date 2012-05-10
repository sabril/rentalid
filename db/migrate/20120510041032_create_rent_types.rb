class CreateRentTypes < ActiveRecord::Migration
  def change
    create_table :rent_types do |t|
      t.string :type
      t.text :description
      t.string :updated_by
      t.timestamps
    end
  end
end
