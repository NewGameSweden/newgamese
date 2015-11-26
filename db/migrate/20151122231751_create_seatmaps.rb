class CreateSeatmaps < ActiveRecord::Migration
  def change
    create_table :seatmaps do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
