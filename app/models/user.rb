class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :comments
  has_many :locations

  validates :email, :password, presence: true, on: :create
  validates :name, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true
  validates :about, :city, :state, presence: true, on: :update

end
