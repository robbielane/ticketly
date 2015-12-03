require 'test_helper'

class OrderTicketTest < ActiveSupport::TestCase
  def valid_attributes
    {
      quantity: 1,
      price: 1001
    }
  end

  test "a valid ordered trip can be created" do
    ordered_trip = OrderTicket.new(valid_attributes)
    assert ordered_trip.valid?
  end

  test "it can't have a negative quantity" do
    skip
    ordered_trip = OrderTicket.new(quantity: -1,
                                   price: 100)
    refute ordered_trip.valid?
  end
end
