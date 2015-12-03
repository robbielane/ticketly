class Ticket < ActiveRecord::Base
  belongs_to :category
  belongs_to :event
  has_many :ordered_trips
  has_many :orders, through: :ordered_trips
  belongs_to :vendor

  validates :price, :category_id, presence: true
  validates_numericality_of :price, greater_than: 0

  enum status: [ :active, :retired]

  def retire
    self.update(status: "retired")
  end

  def retired?
    status == "retired"
  end
end
