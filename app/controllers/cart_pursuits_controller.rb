class CartPursuitsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    pursuit = Pursuit.find(params[:pursuit_id])
    @cart.add_trip(pursuit.id)
    session[:cart] = @cart.trips

    flash[:notice] = "You have #{pluralize(@cart.count_of(pursuit.id), pursuit.name)}."
    redirect_to pursuits_path
  end

  def new
  end
end
