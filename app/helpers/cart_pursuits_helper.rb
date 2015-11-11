module CartPursuitsHelper
  def total_cost_of_trips
    prices = pursuits_in_cart.reduce([]) do |prices, pursuit|
      prices << pursuit.price
    end
    prices.sum
  end
end
