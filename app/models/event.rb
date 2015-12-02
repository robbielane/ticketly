class Event < ActiveRecord::Base
  has_many :tickets
  belongs_to :category
  validates :name, :venue, :location_city, :location_state, presence: true

end
