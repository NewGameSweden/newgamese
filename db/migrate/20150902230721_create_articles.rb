class CreateArticles < ActiveRecord::Migration
  require 'postgres_ext'
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
