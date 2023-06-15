class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
