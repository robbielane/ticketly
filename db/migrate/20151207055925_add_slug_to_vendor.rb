class AddSlugToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :slug, :string
  end
end
