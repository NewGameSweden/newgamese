class AddStateToSeats < ActiveRecord::Migration
  def change
    add_column :seats, :state, :string
  end
end
