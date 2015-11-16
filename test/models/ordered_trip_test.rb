require 'test_helper'

class OrderedTripTest < ActiveSupport::TestCase
  def valid_attributes
    {
      travellers: 2,
      price: 1001
    }
  end

  test "a valid ordered trip can be created" do
    ordered_trip = OrderedTrip.new(valid_attributes)
    assert ordered_trip.valid?
  end
end
