class AddUrlHashToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :url_hash, :string, null: false
  end
end
