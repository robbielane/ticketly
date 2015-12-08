class Event < ActiveRecord::Base
  has_many :tickets
  belongs_to :category
  validates :name, :venue, :location_city, :location_state, presence: true
  searchkick
  scope :current, -> { where("date_time > ?", Time.now) }
  scope :just_added, -> { order("created_at DESC").limit(10) }

  def parse_date_time(date)
    date = Date.strptime(date, "%m/%d/%Y")
    self.date_time = DateTime.parse(date.to_s)
  end
end
