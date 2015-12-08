module OrdersHelper
  def order_tickets_list(order)
    tickets = tickets_names_and_travellers(order)
    tickets.join(",  <br>")
  end

  def tickets_names_and_travellers(order)
    order.tickets.map { |ticket| format_name_and_tickets(order, ticket) }
  end

  def ticket_name_and_quantity(order, target_ticket)
    ticket_name = order.tickets.map do |ticket|
      next unless target_ticket.id.to_i == ticket.id
      format_name_and_tickets(order, ticket)
    end
    ticket_name.compact[0]
  end

  def format_name_and_tickets(order, ticket)
    OrderTicket.find_by(ticket_id: ticket.id, order_id: order.id)
    "#{Event.find(ticket.event_id).name}"
  end

  def filter_by_status
    Order.all.each { |order| order.status == "#{status}" }
  end
end
