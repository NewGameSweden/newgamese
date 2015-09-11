class AddUserfields < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :street, :string
  	add_column :users, :postal_code, :integer
  	add_column :users, :postal_city, :string
  end
end
