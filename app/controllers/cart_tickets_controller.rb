class CartTicketsController < ApplicationController
  def create
    ticket = Ticket.find(params[:ticket_id])
    @cart.add_ticket(ticket.id)
    @cart.update(ticket.id, 1)

    session[:cart] = @cart.tickets
    flash[:notice] = "#{ticket.event.name} ticket added to your cart."
    redirect_to events_path
  end

  def new
  end

  def show
    @tickets = @cart.tickets_in_cart
  end

  def delete
    trip = Ticket.find(params[:ticket_id])
    @cart.remove(trip)

    flash[:notice] = "You have removed the trip #{view_context.link_to(ticket.event.name, ticket_path(trip))} from your cart."
    redirect_to cart_path
  end
end
