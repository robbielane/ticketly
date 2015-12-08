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

  test "an order requires a status" do
    user = users(:one)
    vendor = vendors(:one)

    order = Order.create(
                          user_id: user.id,
                            total: 10,
                        vendor_id: vendor.id
                         )
    assert order.valid?
  end
end
