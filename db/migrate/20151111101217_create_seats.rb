class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :number
      t.references :row, index: true

      t.timestamps null: false
    end
    add_foreign_key :seats, :rows
  end
end
