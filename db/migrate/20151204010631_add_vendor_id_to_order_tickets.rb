class AddVendorIdToOrderTickets < ActiveRecord::Migration
  def change
    add_reference :order_tickets, :vendor, index: true, foreign_key: true
  end
end
