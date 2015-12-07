
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "and order is valid" do
    order = orders(:one)
    assert order.valid?
  end

  test "an order can be updated" do
    order = orders(:one)
    assert_equal "Paid", order.status
    status = "Cancelled"
    order.update_status(status)
    assert_equal "Cancelled", order.status
  end
end
