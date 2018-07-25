class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :about, :city
  has_many :events
  has_many :rsvps
end
