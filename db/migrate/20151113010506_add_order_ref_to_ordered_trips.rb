class AddOrderRefToOrderedTrips < ActiveRecord::Migration
  def change
    add_reference :ordered_trips, :order, index: true, foreign_key: true
  end
end
