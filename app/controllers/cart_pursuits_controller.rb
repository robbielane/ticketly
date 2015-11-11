class CartPursuitsController < ApplicationController
  def create
    pursuit = Pursuit.find(params[:pursuit_id])
    @cart.add_trip(pursuit.id)
    session[:cart] = @cart.trips

    flash[:notice] = "You have added #{pursuit.name} to your cart."
    redirect_to pursuits_path
  end

  def new
  end

  def show
    @pursuits = pursuits_in_cart
  end
end
