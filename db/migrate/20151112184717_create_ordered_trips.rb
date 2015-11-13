class CreateOrderedTrips < ActiveRecord::Migration
  def change
    create_table :ordered_trips do |t|
      t.integer :travellers
      t.integer :price

      t.timestamps null: false
    end
  end
end
