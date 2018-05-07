class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :comments
end
