class Location < ApplicationRecord
  has_many :events
  has_many :users, through: :events

  validates :name, :address, :city, :state, presence: true
end
