class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :plan_id, :default => 1
      t.string :time_zone, :default => "Jakarta"
      t.timestamps
    end
  end
end
