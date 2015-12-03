class RemoveTravellersFromOrderedTrips < ActiveRecord::Migration
  def change
    rename_table :ordered_trips, :order_tickets
    remove_column :order_tickets, :travellers
    add_column :order_tickets, :quantity, :int
  end


end
