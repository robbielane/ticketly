class PlatformAdmin::AdminController < PlatformAdmin::BaseController
  def dashboard
    @statuses = ["active", "inactive"]
    @vendors = Vendor.all
  end
end
