class Event < ActiveRecord::Base
  has_many :tickets
  belongs_to :category
  validates :name, :venue, :location_city, :location_state, presence: true
  searchkick

  scope :just_added, -> { order("created_at DESC").limit(10) }
  scope :current, -> { where("date_time > ?", Time.now) }
end
