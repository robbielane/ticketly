module OrdersHelper

  def order_pursuits_list(order)
    pursuits = order.pursuits.map do |pursuit|
      num_travellers = OrderedTrip.find_by(pursuit_id: pursuit.id, order_id: order.id).travellers
      "#{pursuit.name} (Travellers: #{num_travellers || 1})"
    end
    pursuits.join(",  <br>")
  end
end
