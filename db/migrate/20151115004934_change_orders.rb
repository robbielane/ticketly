class ChangeOrders < ActiveRecord::Migration
  def up
    change_column :orders, :status, :string, :default => "Pending"
  end
end
