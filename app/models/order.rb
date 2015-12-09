class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_tickets
  has_many :tickets, through: :order_tickets
  belongs_to :vendor
  validates :status, presence: true
  before_create :set_hash

  def self.make_new(cart, current_user)
    order = current_user.orders.create(total: cart.total_cost)
    cart.ordered_tickets.each do |ticket|
      order.order_tickets.create(ticket_id: ticket.ticket_id)
    end
    order
  end

  def update_status(status)
    update(status: status)
  end

  def generate_hash
    loop do
      random_hash = SecureRandom.hex(10)
      break random_hash unless Order.exists?(url_hash: random_hash)
    end
  end

  def set_hash
    self.url_hash = generate_hash
  end
end
