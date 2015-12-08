class RemoveNameFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :name
  end
end
