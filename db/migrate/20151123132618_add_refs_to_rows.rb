class AddRefsToRows < ActiveRecord::Migration
  def change
    add_reference :rows, :seatmap, index: true
    add_foreign_key :rows, :seatmaps
  end
end
