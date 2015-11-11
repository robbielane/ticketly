require "test_helper"

class CartTest < ActiveSupport::TestCase
  attr_accessor :cart

  def setup
    @cart = Cart.new({})
  end

  def add_trips_to_cart(num)
    num.times do |i|
      @cart.add_trip(i)
    end
  end

  test "cart can store trips" do
    initial_count = @cart.total_trips

    @cart.add_trip(3)

    current_count = @cart.total_trips

    assert_equal 1, current_count - initial_count
  end

  test "cart can return total number of trips" do
    add_trips_to_cart(5)
    total = @cart.total_trips

    assert_equal 5, total
  end

  test "cart can return total price of all trips" do
    skip
  end

  test "cart can remove trips" do
    skip
  end

  test "cart can update trips" do
    skip
  end
end
