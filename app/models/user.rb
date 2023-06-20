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

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー(管理者)"
      user.admin = true
      user.role = "Barista"
    end
  end

  def self.guest_coffee_farm
    find_or_create_by!(email: 'guest_craftman@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      user.role = "Coffee_farm"
    end
  end  
end
