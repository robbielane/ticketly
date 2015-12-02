class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :location_city
      t.string :location_state
      t.string :venue
      t.datetime :date_time

      t.timestamps null: false
    end
  end
end
