module CartPursuitsHelper
  def total_cost_of_trips
    prices = pursuits_in_cart.reduce([]) do |prices, pursuit|
      prices << (pursuit.price * @cart.trips[pursuit.id.to_s])
    end
    prices.sum
  end
end
