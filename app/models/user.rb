class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :comments

  validates :email, :password, :name, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true

end
