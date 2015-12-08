class Ticket < ActiveRecord::Base
  belongs_to :event
  belongs_to :vendor

  has_many :order_tickets
  has_many :orders, through: :order_tickets

  validates :price, presence: true
  validates_numericality_of :price, greater_than: 0

  enum status: [:active, :retired]

  scope :vendor_order_tickets, ->(vendor) { where("vendor_id = ?", vendor) }
  scope :active, -> { where(status: 0) }
  scope :desc_order, -> { order("created_at DESC")}

  def retire
    self.update(status: "retired")
  end

  def retired?
    status == "retired"
  end

end
