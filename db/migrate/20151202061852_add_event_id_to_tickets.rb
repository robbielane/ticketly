class AddEventIdToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :event, index: true, foreign_key: true
  end
end
