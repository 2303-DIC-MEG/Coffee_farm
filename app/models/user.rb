class User < ApplicationRecord
  enum role: { Coffee_farm: 0, Barista: 1 }
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  has_many :blogs
  has_one :profile
  has_many :favorites, dependent: :destroy

  def already_favorited?(blog)
    favorites.exists?(blog_id: blog.id)
  end
end
