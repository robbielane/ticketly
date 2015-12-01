class Cart
  attr_reader :trips

  def initialize(raw_data)
    @trips = raw_data || {}
  end

  def add_trip(ticket_id)
    trips[ticket_id.to_s] ||= 0
    trips[ticket_id.to_s] += 1
  end

  def total_trips
    trips.to_a.count
  end

  def count_of(ticket_id)
    trips[ticket_id.to_s]
  end

  def remove(ticket)
    trips.delete(ticket.id.to_s)
  end

  def update(ticket_id, travellers)
    trips[ticket_id] = travellers.to_i.abs
  end

  def ordered_tickets
    trips.map do |ticket_id, travellers|
      ticket = Ticket.find(ticket_id.to_i)
      Orderedticket.new(ticket_id, travellers, ticket.price)
    end
  end

  def tickets_in_cart
    trips.keys.map { |trip_id| Ticket.find(trip_id.to_i) }
  end

  def total_cost
    prices = tickets_in_cart.reduce([]) do |prices, ticket|
      prices << (ticket.price * trips[ticket.id.to_s]).abs
    end
    prices.sum
  end
end
