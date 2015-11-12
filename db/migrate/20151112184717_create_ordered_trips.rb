class CreateOrderedTrips < ActiveRecord::Migration
  def change
    create_table :ordered_trips do |t|
      t.string :name
      t.integer :travellers
      t.integer :price
      
      t.timestamps null: false
    end
  end
end
