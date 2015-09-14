class CreateArticles < ActiveRecord::Migration
  def change
  	drop_table :comments
  	drop_table :articles
  	drop_table :users
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
