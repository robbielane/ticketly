class VendorAdmin::OrdersController < VendorAdmin::BaseController
  def index
    @orders = Order.all
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
    redirect_to vendor_admin_order_path(@order)
  end
end
