class CreatePostTagRerations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tag_rerations do |t|
      t.references :post,  null: false,  foreign_key: true
      t.references :tag,  null: false,  foreign_key: true

      t.timestamps
    end
  end
end
