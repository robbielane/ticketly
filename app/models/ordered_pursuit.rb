class Orderedticket
  attr_reader :ticket_id, :travellers, :price

  def initialize(ticket_id, travellers, price)
    @ticket_id = ticket_id
    @travellers = travellers.abs
    @price = price
  end
end
