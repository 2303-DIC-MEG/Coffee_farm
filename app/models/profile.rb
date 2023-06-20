class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.guest_admin_profile
    find_or_create_by!(name: 'admin_store') do |profile|
      profile.address = "東京駅"
      guest_admin = User.find_by(email: 'guest_admin@example.com')
      profile.user_id = guest_admin.id
    end
  end

  def self.guest_profile
    find_or_create_by!(name: 'guest_farm') do |profile|
      profile.address = "コーヒー農園"
      guest_user = User.find_by(email: 'guest_craftman@example.com')
      profile.user_id = guest_user.id
    end
  end
end
