class Tag < ApplicationRecord
  has_many :post_tag_rerations, dependent: :destroy
  has_many :post, through: :post_tag_rerations
end
