class PostImage < ApplicationRecord
  belongs_to :post
  attachment :file
end
