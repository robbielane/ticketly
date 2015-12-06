class Ticket < ActiveRecord::Base
  belongs_to :event
  belongs_to :vendor

  has_many :order_tickets
  has_many :orders, through: :order_tickets

  validates :price, presence: true
  validates_numericality_of :price, greater_than: 0

  enum status: [ :active, :retired]

  def retire
    self.update(status: "retired")
  end

  def retired?
    status == "retired"
  end

  def event_name
  end
end
