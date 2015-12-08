require "test_helper"

class TicketTest < ActiveSupport::TestCase

  def create_ticket 
    Ticket.create!({ name: "Hiking in the Alps", price: 100})
  end

  test "a valid ticket can be created" do
    ticket = create_ticket
    
    assert ticket.valid?
  end

  test "it is invalid with missing price" do
    ticket = create_ticket
    ticket.price = nil

    refute ticket.valid?
  end

  test "it must have a price that is greater than zero" do
    ticket = create_ticket
    ticket.price = -1

    ticket = refute ticket.valid?
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
