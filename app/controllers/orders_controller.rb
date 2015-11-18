class OrdersController < ApplicationController

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    if current_user
      Order.make_new(@cart, current_user)
      flash[:notice] = "Order was successfully placed"
      session[:cart].clear
      redirect_to orders_path
    else
      flash[:notice] = "You must be logged in to checkout"
      redirect_to login_path
    end
  end

  def index
    if current_user.admin?
      @orders = Order.all
    else
      @orders = current_user.orders
    end
  end
end
