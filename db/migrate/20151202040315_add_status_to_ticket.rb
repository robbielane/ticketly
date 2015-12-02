class AddStatusToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :status, :integer, default: 0
  end
end
