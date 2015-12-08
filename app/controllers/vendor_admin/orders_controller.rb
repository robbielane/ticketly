class VendorAdmin::OrdersController < VendorAdmin::BaseController
  def index
    user = current_user
    @orders = user.orders.all
  end

  def show
    binding.pry
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update_status(params[:status])
    redirect_to vendor_order_path(id: @order.id)
  end
end
