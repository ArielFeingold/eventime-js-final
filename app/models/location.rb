class Location < ApplicationRecord
  has_many :events
  has_many :users, through: :events
  belongs_to :user

  validates :name, :address, :city, :state, presence: true
end
