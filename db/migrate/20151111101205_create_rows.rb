class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.string :name
      t.integer :x_coord
      t.integer :y_coord
      t.references :seatmap, index: true

      t.timestamps null: false
    end
    add_foreign_key :rows, :seatmaps
  end
end
