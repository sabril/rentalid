class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :picturable, :polymorphic => true
      t.string :photo

      t.timestamps
    end
  end
end
