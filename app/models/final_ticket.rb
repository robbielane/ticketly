class FinalTicket
  attr_reader :ticket_id, :quantity, :price

  def initialize(ticket_id, quantity, price)
    @ticket_id = ticket_id
    @quantity = quantity.abs
    @price = price
  end
end
