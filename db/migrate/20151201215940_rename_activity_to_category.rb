class RenameActivityToCategory < ActiveRecord::Migration
  def change
    rename_table :activities, :categories
  end
end
