class Admin::OrdersController < Admin::BaseController

  def index
    if current_user.admin?
      @orders = Order.all
    else
      @orders = current_user.orders
    end
  end

  def show
    @order = Order.find(params[:id])
    if current_user.admin?
      render "admin/show"
    else
      @order = Order.find(params[:id])
    end
  end
end
