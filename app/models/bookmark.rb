class Bookmark < ApplicationRecord
  belongs_to :post, counter_cache: :bookmarks_count
  belongs_to :user
end
