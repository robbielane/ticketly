class AddImageToPursuits < ActiveRecord::Migration
  def change
    add_column :pursuits, :image, :string
  end
end
