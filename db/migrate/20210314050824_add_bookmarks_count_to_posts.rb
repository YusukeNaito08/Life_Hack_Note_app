class AddBookmarksCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :bookmarks_count, :integer
  end
end
