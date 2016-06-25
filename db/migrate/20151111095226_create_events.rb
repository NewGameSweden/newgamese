class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :last_reserv_date
      t.datetime :start_at
      t.datetime :end_at
      t.string :location

      t.timestamps null: false
    end
  end
end
