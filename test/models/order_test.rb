require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "order can be created" do
    skip
    user = User.create(username: "Nicole", password: "password", interests: "cars")
    activity = Activity.create(name: "Outdoors")
    fun_trip = Pursuit.create(name: "Hiking", description: "hike the Alps!", price: 1001, activity_id: activity.id)
    cart = Cart.new(fun_trip)
    order = Order.make_new(cart, user)

    assert_equal 1001, order[:price]
  end
end
