class Tag < ApplicationRecord
  has_many :post_tag_rerations, dependent: :destroy
  has_many :post, through: :posts
  
  
   
end
