class Event < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :rsvps
  has_many :users, through: :rsvps
  has_many :comments

  accepts_nested_attributes_for :location
end
