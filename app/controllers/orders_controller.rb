class OrdersController < ApplicationController

  def create
    if current_user
      Order.make_new(@cart, current_user)
      flash[:notice] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash[:notice] = "You must be logged in to checkout"
      redirect_to login_path
    end
  end

  def index
    current_user.orders.all
  end
end
