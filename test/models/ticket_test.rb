require "test_helper"

class TicketTest < ActiveSupport::TestCase

  def create_ticket
    Ticket.create!({ price: 100})
  end

  test "a valid ticket can be created" do
    ticket = create_ticket

    assert ticket.valid?
  end

  test "it is invalid with missing price" do
    ticket = Ticket.new( seat:"a" , section:"b", row:"c" )

    ticket.price = nil

    refute ticket.valid?
  end

  test "it must have a price that is greater than zero" do

    ticket = Ticket.new(price:-1, seat:"a" , section:"b", row:"c" )

    ticket.price = -1

    refute ticket.valid?
  end

  test "it can be retired" do
    ticket = create_ticket
    refute ticket.retired?

    ticket.retire

    assert ticket.retired?
    assert ticket.valid?
    assert_equal "retired", ticket.status
  end
end
