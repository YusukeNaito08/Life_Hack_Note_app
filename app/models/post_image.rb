class PostImage < ApplicationRecord
  belongs_to :post
  attachment :file,  type: :image
end
