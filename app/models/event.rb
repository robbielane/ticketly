class Event < ActiveRecord::Base
  has_many :tickets
  belongs_to :category
  validates :name, :venue, :location_city, :location_state, presence: true
  searchkick
  scope :current, -> { where("date_time > ?", Time.now) }
  scope :just_added, -> { order("created_at DESC").limit(10) }
  geocoded_by :full_address
  after_validation :geocode

  def parse_date_time(date)
    date = Date.strptime(date, "%m/%d/%Y")
    self.date_time = DateTime.parse(date.to_s)
  end

  def full_address
    "#{self.street_address}, #{self.location_city}, #{self.location_state}"
  end
end
