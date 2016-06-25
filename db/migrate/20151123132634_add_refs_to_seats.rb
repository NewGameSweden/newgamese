class AddRefsToSeats < ActiveRecord::Migration
  def change
    add_reference :seats, :row, index: true
    add_foreign_key :seats, :rows
  end
end
