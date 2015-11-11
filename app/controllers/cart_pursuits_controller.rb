class CartPursuitsController < ApplicationController
  def create
    pursuit = Pursuit.find(params[:pursuit_id])
    @cart.add_trip(pursuit.id)
    @cart.trips[pursuit.id.to_s] = params[:travellers].to_i
    session[:cart] = @cart.trips

    flash[:notice] = "You have added #{pursuit.name} to your cart."
    redirect_to pursuits_path
  end

  def new
  end

  def show
    @pursuits = pursuits_in_cart
  end

  def update
    pursuit = Pursuit.find(params[:pursuit_id])
    @cart.trips[pursuit.id.to_s] = params[:travellers].to_i
    session[:cart] = @cart.trips

    flash[:notice] = "You have updated Travellers for the trip #{pursuit.name} in your cart."
    redirect_to cart_path
  end
end
