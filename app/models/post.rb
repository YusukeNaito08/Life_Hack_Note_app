class Post < ApplicationRecord
  belongs_to :user
  has_many :post_images, dependent: :destroy
  has_many :post_tag_rerations, dependent: :destroy
  has_many :tags, through: :post_tag_rerations
  has_many :bookmarks, dependent: :destroy
  

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 200}

  accepts_attachments_for :post_images, attachment: :file

  # View数
  is_impressionable counter_cache: true

  # bookmark
  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  # タグ
  def save_posts(tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << post_tag # 配列に代入保存(push)
    end
  end
end
