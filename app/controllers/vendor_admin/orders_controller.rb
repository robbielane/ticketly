class VendorAdmin::OrdersController < VendorAdmin::BaseController
  def index
    user = current_user
    @orders = user.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    valid = ["Paid", "Cancelled", "Completed", "Pending"]
    if valid.include?(params[:order_status])
      @order.update_status(params[:order_status])
    else
      flash[:notice] = "Invalid Order Status"
    end
    redirect_to vendor_order_path(id: @order.id)
  end
end
