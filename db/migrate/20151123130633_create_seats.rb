class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :number

      t.timestamps null: false
    end
  end
end
