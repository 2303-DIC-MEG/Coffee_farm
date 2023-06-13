class User < ApplicationRecord
  enum role: { Coffee_farm: 0, Barista: 1 }
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  has_many :blogs
  has_one :profile
  has_many :favorites, dependent: :destroy
  has_many :likes_blogs, through: :likes, source: :blog
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
end
