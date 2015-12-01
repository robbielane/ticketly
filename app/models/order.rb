class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_trips
  has_many :tickets, through: :ordered_trips

  def self.make_new(cart, current_user)
    order = current_user.orders.create(total: cart.total_cost)
    cart.ordered_tickets.each do |ticket|
      order.ordered_trips.create(ticket_id: ticket.ticket_id,
                                 travellers: ticket.travellers,
                                 price: ticket.price)
    end
  end

  def update_status(status)
    update(status: status)
  end
end
