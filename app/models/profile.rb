class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 100 }
  validates :country, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.guest_admin_profile
    find_or_create_by!(name: 'admin_store') do |profile|
      profile.name = "admin_store"
      profile.country = "日本"
      profile.address = "東京駅"
      profile.description = "美味しいコーヒー売ってます"
      profile.image = "app/assets/images/logo.png"
      guest_admin = User.find_by(email: 'guest_admin@example.com')
      profile.user_id = guest_admin.id
    end
  end

  def self.guest_profile
    find_or_create_by!(name: 'guest_farm') do |profile|
      profile.name = "guest_farm"
      profile.country = "USA"
      profile.address = "71-101 Kamehameha Hwy, Wahiawa, HI 96786"
      profile.description = "お豆作ってますよー！！"
      profile.image = "app/assets/images/logo.png"
      guest_user = User.find_by(email: 'guest_craftman@example.com')
      profile.user_id = guest_user.id
    end
  end
end
