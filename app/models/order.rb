class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_tickets
  has_many :tickets, through: :order_tickets
  belongs_to :vendor
  validates :status, presence: true
  def self.make_new(cart, current_user)
    order = current_user.orders.create(total: cart.total_cost)
    cart.ordered_tickets.each do |ticket|
      order.order_tickets.create(ticket_id: ticket.ticket_id)
    end
  end

  def update_status(status)
    update(status: status)
  end
end
