class VendorAdmin::VendorController < ApplicationController
  before_action :current_vendor?

  def dashboard
    @vendor_admin = current_user
    @statuses = ["Completed", "Pending", "Paid", "Cancelled"]
    vendor = Vendor.find_by(user_id: current_user.id)
    @orders = OrderTicket.find_by(vendor_id: vendor.id)
  end
end
