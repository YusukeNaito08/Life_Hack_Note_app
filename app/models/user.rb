class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  attachment :image

  validates :name,  presence: true, uniqueness: true, length: {maximum: 10 }
  validates :email, presence: true, uniqueness: true

  #ゲストユーザー
  def self.guest
    find_or_create_by!(name: 'ゲストユーザー', email: 'guest@lifehacknote.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    end
  end

end
