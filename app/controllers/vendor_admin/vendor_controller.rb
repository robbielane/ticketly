class VendorAdmin::VendorController < ApplicationController
  before_action :current_vendor?

  def dashboard
    @vendor_admin = current_user
    @statuses = ["Completed", "Pending", "Paid", "Cancelled"]
  end
end
