class Blog < ApplicationRecord
  validates :title, presence: true
  mount_uploader :image, ImageUploader
  def self.search(search)
    return Blog.all unless search
    Blog.where(['content LIKE(?) OR title LIKE(?)', "%#{search}%", "%#{search}%"])
  end
end
