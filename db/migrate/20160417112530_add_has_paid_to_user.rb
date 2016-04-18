class AddHasPaidToUser < ActiveRecord::Migration
  def change
    add_column :users, :has_paid, :boolean
  end
end
