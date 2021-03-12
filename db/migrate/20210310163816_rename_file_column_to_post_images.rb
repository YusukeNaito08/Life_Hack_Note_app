class RenameFileColumnToPostImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_images, :file, :file_id
  end
end
