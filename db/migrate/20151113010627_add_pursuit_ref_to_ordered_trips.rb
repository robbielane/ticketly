class AddPursuitRefToOrderedTrips < ActiveRecord::Migration
  def change
    add_reference :ordered_trips, :pursuit, index: true, foreign_key: true
  end
end
