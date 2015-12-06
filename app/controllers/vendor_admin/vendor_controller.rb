class VendorAdmin::VendorController < ApplicationController
  before_action :current_vendor?

  def dashboard
    @statuses = ["Completed", "Pending", "Paid", "Cancelled"]
    @vendor = Vendor.find_by(user_id: current_user.id)
    @orders = @vendor.orders
  end
end
