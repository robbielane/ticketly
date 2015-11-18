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
    activity = Activity.create(name: "Hiking")
    activity.pursuits.create(name: "Hiking in FL", description: "hiking", price: 10)
    activity.pursuits.create(name: "Hiking in LA", description: "hiking", price: 1)

    @cart.add_trip(Pursuit.first.id)
    @cart.add_trip(Pursuit.last.id)

    assert_equal 11, @cart.total_cost
  end

  test "cart can remove trips" do
    add_trips_to_cart(1)
    pursuit = Pursuit.create(name: "Jetskiing",
                             description: "words",
                             price: 100,
                             id: @cart.trips.keys.first.to_i)

    original_total = @cart.total_trips
    @cart.remove(pursuit)
    current_total = @cart.total_trips

    assert_equal 1, original_total - current_total
  end

  test "cart can return number of travellers for each trip" do
    add_trips_to_cart(2)
    @cart.update("1", 4)

    assert_equal 4, @cart.count_of(1)
  end

  test "cart can update trips" do
    add_trips_to_cart(2)
    original_count = @cart.count_of(1)

    assert_equal 1, original_count

    @cart.update("1", 7)
    updated_count = @cart.count_of(1)

    assert_equal 7, updated_count
  end
end
