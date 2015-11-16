class Pursuit < ActiveRecord::Base
  belongs_to :activity
  has_many :ordered_trips
  has_many :orders, through: :ordered_trips

  validates :name, :description, :price, :activity_id, presence: true
  validates_numericality_of :price, greater_than: 0
  # validates :name, uniqueness: true

  def retire
    self.update(status: "retired")
  end

  def retired?
    status == "retired"
  end
end
