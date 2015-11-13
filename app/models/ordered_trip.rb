class OrderedTrip < ActiveRecord::Base
  has_many :ordered_trips
  has_many :orders, through: :ordered_trips
end
