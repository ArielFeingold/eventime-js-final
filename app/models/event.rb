class Event < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :rsvps, dependent: :destroy
  has_many :users, through: :rsvps
  has_many :comments

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :rsvps

  validates :title, :description, :date, :time, presence: true
  validate :event_date_cannot_be_in_the_past

  def event_date_cannot_be_in_the_past
    if self.date.present? && self.date < Date.today
     errors.add(:past_date, "Event can't be in the past")
   end
  end

  def self.most_recent(limit)
    order("created_at desc").limit(limit)
  end


end
