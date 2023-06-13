class User < ApplicationRecord
  has_many :blogs
  has_one :profile
  has_many :favorites, dependent: :destroy
  has_many :likes_blogs, through: :likes, source: :blog
  enum role: { Coffee_farm: 0, Barista: 1 }
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

end
