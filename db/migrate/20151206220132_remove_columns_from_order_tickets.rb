class RemoveColumnsFromOrderTickets < ActiveRecord::Migration
  def change
    remove_column :order_tickets, :vendor_id
    remove_column :order_tickets, :price
    remove_column :order_tickets, :quantity
  end
end
