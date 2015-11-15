class AddColumnToPursuits < ActiveRecord::Migration
  def change
    add_column :pursuits, :status, :text, default: "active"
  end
end
