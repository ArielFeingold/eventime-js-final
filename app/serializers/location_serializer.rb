class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state
  belongs_to :user
  has_many :events
end
