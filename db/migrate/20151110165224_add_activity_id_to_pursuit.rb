class AddActivityIdToPursuit < ActiveRecord::Migration
  def change
    add_reference :pursuits, :activity, index: true, foreign_key: true
  end
end
