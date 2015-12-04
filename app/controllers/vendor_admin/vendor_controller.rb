class VendorAdmin::VendorController < ApplicationController
  before_action :current_vendor?

  def dashboard
    @vendor_admin = current_user
    @statuses = ["Completed", "Pending", "Paid", "Cancelled"]
    vendor = Vendor.find_by(user_id: current_user.id)
    vendor_orders = OrderTicket.where(vendor_id: vendor.id)
    @orders = vendor_orders.map { |order| Order.where(id: order.order_id)}
  end
end
