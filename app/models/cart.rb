class Cart
  attr_reader :tickets

  def initialize(raw_data)
    @tickets = raw_data || {}
  end

  def add_ticket(ticket_id)
    tickets[ticket_id.to_s] ||= 0
    tickets[ticket_id.to_s] += 1
  end

  def total_tickets
    tickets.to_a.count
  end

  def count_of(ticket_id)
    tickets[ticket_id.to_s]
  end

  def remove(ticket)
    tickets.delete(ticket.id.to_s)
  end

  def update(ticket_id, quantity)
    tickets[ticket_id] = quantity.to_i.abs
  end

  def ordered_tickets
    tickets.map do |ticket_id, quantity|
      ticket = Ticket.find(ticket_id.to_i)
      ticket.retire
      FinalTicket.new(ticket_id, quantity, ticket.price)
    end
  end

  def tickets_in_cart
    tickets.keys.map { |ticket_id| Ticket.find(ticket_id.to_i) }
  end

  def total_cost
    prices = tickets_in_cart.reduce([]) do |prices, ticket|
      prices << (ticket.price * count_of(ticket[:id.to_s]))
    end
    prices.sum
  end
end
