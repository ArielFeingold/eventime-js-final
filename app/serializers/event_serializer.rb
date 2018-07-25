class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :time, :rsvps, :user_id
  belongs_to :user
  belongs_to :location
end
