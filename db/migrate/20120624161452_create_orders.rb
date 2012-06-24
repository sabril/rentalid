class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.date :o_date
      t.float :total

      t.timestamps
    end
  end
end
