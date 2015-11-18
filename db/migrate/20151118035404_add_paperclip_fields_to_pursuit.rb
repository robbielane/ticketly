class AddPaperclipFieldsToPursuit < ActiveRecord::Migration
  def change
    add_column :pursuits, :image_file_name,    :string
    add_column :pursuits, :image_content_type, :string
    add_column :pursuits, :image_file_size,    :integer
    add_column :pursuits, :image_updated_at,   :datetime
  end
end
