class AddVendorIdToTicket < ActiveRecord::Migration
  def change
    add_reference :tickets, :vendor, index: true, foreign_key: true
  end
end
