class AddEventRefToSeatmap < ActiveRecord::Migration
  def change
    add_reference :seatmaps, :event, index: true
    add_foreign_key :seatmaps, :events
  end
end
