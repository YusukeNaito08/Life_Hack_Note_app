class RenameImageIdColumnToPostImages < ActiveRecord::Migration[5.2]
  def change
     rename_column :post_images, :image_id, :file
  end
end
