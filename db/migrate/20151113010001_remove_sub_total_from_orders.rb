class RemoveSubTotalFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :sub_total, :integer
  end
end
