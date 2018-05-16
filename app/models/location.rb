class Location < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :users, through: :events
  belongs_to :user

  validates :name, :address, :city, :state, presence: true

  scope :public_locations, -> { where(public: true) }
   scope :nearby, ->(city, state) { where("city = ? AND state = ?", city, state) }
end
