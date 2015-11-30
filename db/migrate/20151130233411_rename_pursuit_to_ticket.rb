class RenamePursuitToTicket < ActiveRecord::Migration

  def change
    rename_table :pursuits, :tickets
    remove_column :tickets, :status
    remove_column :tickets, :image
    remove_column :tickets, :image_file_name
    remove_column :tickets, :image_content_type
    remove_column :tickets, :image_file_size
    remove_column :tickets, :image_updated_at
    remove_column :tickets, :description
    add_column :tickets, :section, :string
    add_column :tickets, :row, :string
    add_column :tickets, :seat, :string
  end
end
