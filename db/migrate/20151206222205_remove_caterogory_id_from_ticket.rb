class RemoveCaterogoryIdFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :category_id 
  end
end
