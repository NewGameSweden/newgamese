class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.string :name
      t.integer :x_coord
      t.integer :y_coord

      t.timestamps null: false
    end
  end
end
