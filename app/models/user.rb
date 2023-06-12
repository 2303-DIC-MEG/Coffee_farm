class User < ApplicationRecord
  has_many :blogs

  enum role: { Coffee_farmer: 0, Barista: 1 }
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  # validates :name, presence: true
  # validates :profile, presence: true
  # validates :occupation, presence: true
  # validates :position, presence: true
end
