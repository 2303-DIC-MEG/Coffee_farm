class Blog < ApplicationRecord
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 300 }

  mount_uploader :image, ImageUploader
  def self.search(search)
    return Blog.all unless search
    Blog.where(['content ILIKE(?) OR title ILIKE(?)', "%#{search}%", "%#{search}%"])
  end
end
