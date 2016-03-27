class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.string :link

      t.timestamps null: false
    end
  end
end
