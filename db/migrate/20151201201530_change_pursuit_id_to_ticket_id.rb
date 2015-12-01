class ChangePursuitIdToTicketId < ActiveRecord::Migration
  def change
    rename_column :ordered_trips, :pursuit_id, :ticket_id
  end
end
