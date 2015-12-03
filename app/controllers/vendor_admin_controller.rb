class VendorAdminController < ApplicationController
  before_action :require_vendor_admin

  def dashboard
    @vendor_admin = current_user
    @statuses = ["Completed", "Pending", "Paid", "Cancelled"]
  end
end
