class RemoveInterestsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :interests, :text
  end
end
