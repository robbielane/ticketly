module OrdersHelper
  def order_tickets_list(order)
    tickets = tickets_names_and_travellers(order)
    tickets.join(",  <br>")
  end

  def tickets_names_and_travellers(order)
    order.tickets.map { |ticket| format_name_and_travellers(order, ticket) }
  end

  def ticket_name_and_travellers(order, target_ticket)
    ticket_name = order.ticketse.map do |ticket|
      next unless target_ticket.id.to_i == ticket.id
      format_name_and_travellers(order, ticket)
    end
    ticket_name.compact[0]
  end

  def format_name_and_travellers(order, ticket)
    num_travellers = OrderTicket.find_by(ticket_id: ticket.id, order_id: order.id).quantity
    "#{ticket.name} (Tickets: #{num_travellers || 1})"
  end

  def filter_by_status
    Order.all.each { |order| order.status == "#{status}" }
  end
end
