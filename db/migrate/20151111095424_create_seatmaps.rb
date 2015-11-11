class CreateSeatmaps < ActiveRecord::Migration
  def change
    create_table :seatmaps do |t|
      t.string :name
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :seatmaps, :events
  end
end
