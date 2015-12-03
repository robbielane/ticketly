class CartTicketsController < ApplicationController
  def create
    ticket = Ticket.find(params[:ticket_id])

    @cart.add_ticket(ticket.id)
    #@cart.update(ticket.id, params[:travellers])

    #session[:cart] = @cart.tickets
    #flash[:notice] = "You have added #{ticket.name} to your cart."
    redirect_to events_path
  end

  def new
  end

  def show
    @tickets = @cart.tickets_in_cart
  end

  def update
    @cart.update(params[:ticket_id], params[:travellers])
    session[:cart] = @cart.trips

    trip_name = Ticket.find(params[:ticket_id]).name

    flash[:notice] = "You have updated Travellers for the trip #{trip_name} in your cart."
    redirect_to cart_path
  end

  def delete
    trip = Ticket.find(params[:ticket_id])
    @cart.remove(trip)

    flash[:notice] = "You have removed the trip #{view_context.link_to(trip.name, ticket_path(trip))} from your cart."
    redirect_to cart_path
  end
end
