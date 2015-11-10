class CreatePursuits < ActiveRecord::Migration
  def change
    create_table :pursuits do |t|
      t.text :name
      t.text :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
