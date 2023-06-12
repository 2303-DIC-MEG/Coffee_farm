class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates_uniqueness_of :picture_id, scope: :user_id
end
