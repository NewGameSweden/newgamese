class AddSocialSecNumber < ActiveRecord::Migration
  def change
   	add_column :users, :ssn, :integer
  end
end
