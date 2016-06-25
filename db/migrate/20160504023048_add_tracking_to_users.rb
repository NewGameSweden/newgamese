class AddTrackingToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
  end
end
