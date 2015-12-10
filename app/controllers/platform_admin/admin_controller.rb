class PlatformAdmin::AdminController < ApplicationController
  def dashboard
    @statuses = ["active", "inactive"]
    @vendors = Vendor.all
  end
end
