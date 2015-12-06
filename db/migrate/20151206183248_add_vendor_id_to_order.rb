class AddVendorIdToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :vendor, index: true, foreign_key: true
  end
end
