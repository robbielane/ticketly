class CartPursuitsController < ApplicationController
  def create
    trip = Pursuit.find(params[:pursuit_id])
    @cart.add_trip(trip.id)
    @cart.trips[trip.id.to_s] = params[:travellers].to_i
    session[:cart] = @cart.trips

    flash[:notice] = "You have added #{trip.name} to your cart."
    redirect_to pursuits_path
  end

  def new
  end

  def show
    @pursuits = pursuits_in_cart
  end

  def update
    trip = Pursuit.find(params[:pursuit_id])
    @cart.trips[trip.id.to_s] = params[:travellers].to_i
    session[:cart] = @cart.trips

    flash[:notice] = "You have updated Travellers for the trip #{trip.name} in your cart."
    redirect_to cart_path
  end

  def delete
    trip = Pursuit.find(params[:pursuit_id])
    @cart.remove(trip)

    flash[:notice] = "You have removed the trip #{view_context.link_to(trip.name, pursuit_path(trip))} from your cart."
    redirect_to cart_path
  end
end
