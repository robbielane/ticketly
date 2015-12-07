require "test_helper"

class TicketTest < ActiveSupport::TestCase

  def valid_attributes
    {
      price: 1001
    }
  end

  test "a valid ticket can be created" do
    ticket = Ticket.new(valid_attributes)
    assert ticket.valid?
  end

  test "it is invalid with missing price" do
    ticket = Ticket.new( seat:"a" , section:"b", row:"c" )

    refute ticket.valid?
  end

  test "it must have a price that is greater than zero" do
    ticket = Ticket.new(price:-1, seat:"a" , section:"b", row:"c" )

    refute ticket.valid?
  end
end
