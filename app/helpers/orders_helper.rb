module OrdersHelper

  def order_pursuits_list(order)
    pursuits = pursuits_names_and_travellers(order)
    pursuits.join(",  <br>")
  end

  def pursuits_names_and_travellers(order)
    order.pursuits.map { |pursuit| format_name_and_travellers(order, pursuit) }
  end

  def pursuit_name_and_travellers(order, target_pursuit)
    pursuit_name = order.pursuits.map do |pursuit|
      next unless target_pursuit.id.to_i == pursuit.id
      format_name_and_travellers(order, pursuit)
    end
    pursuit_name.compact[0]
  end

  def format_name_and_travellers(order, pursuit)
    num_travellers = OrderedTrip.find_by(pursuit_id: pursuit.id, order_id: order.id).travellers
    "#{pursuit.name} (Travellers: #{num_travellers || 1})"
  end

  def filter_by_status
    Order.all.each { |order| order.status == "#{status}" }
  end
end
