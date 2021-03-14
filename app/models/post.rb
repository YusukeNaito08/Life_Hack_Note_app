class Post < ApplicationRecord
  belongs_to :user
  has_many :post_images, dependent: :destroy
  has_many :post_tag_rerations, dependent: :destroy
  has_many :tags, through: :post_tag_rerations
  
  accepts_attachments_for :post_images, attachment: :file
  
  def save_posts(tags)
    current_tags = self.tags.pluck(:tga_name) unless self.tags.nil? #pluckメソッド一旦全てのデータを取得
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    
    #Destroy
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end
  
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name:new_name)
      self.tags << post_tag #配列に代入保存(push)
    end
  end  
end

