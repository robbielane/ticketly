class ChangeActivityIdToCategoryId < ActiveRecord::Migration
  def change
    rename_column :tickets, :activity_id, :category_id
  end
end
