class OrderedTrip < ActiveRecord::Base
  belongs_to :order
  belongs_to :pursuit
end
