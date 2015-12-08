require "test_helper"

class CartTest < ActiveSupport::TestCase
  attr_accessor :cart

  def setup
    @cart = Cart.new({})
  end

  def add_tickets_to_cart(num)
    num.times do |i|
      @cart.add_ticket(i)
    end
  end

  test "cart can store trips" do
    initial_count = @cart.total_tickets
    @cart.add_ticket(3)
    current_count = @cart.total_tickets

    assert_equal 1, current_count - initial_count
  end

  test "cart can return total number of trips" do
    add_tickets_to_cart(5)
    total = @cart.total_tickets

    assert_equal 5, total
  end

  test "cart can return total price of all trips" do
    Ticket.create(price: 10)
    Ticket.create(price: 1)

    @cart.add_ticket(Ticket.first.id)
    @cart.add_ticket(Ticket.last.id)

    assert_equal 71, @cart.total_cost
  end

  test "cart can remove trips" do
    add_tickets_to_cart(1)
    ticket = Ticket.create(  price: 100,
                             id: @cart.tickets.keys.first.to_i)

    original_total = @cart.total_tickets
    @cart.remove(ticket)
    current_total = @cart.total_tickets

    assert_equal 1, original_total - current_total
  end

  test "cart can update trips" do
    add_tickets_to_cart(2)
    original_count = @cart.count_of(1)

    assert_equal 1, original_count

    @cart.update("1", 7)
    updated_count = @cart.count_of(1)

    assert_equal 7, updated_count
  end
end
