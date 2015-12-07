class PlatformAdmin::AdminController < PlatformAdmin::BaseController
  before_action :platform_admin?

  def dashboard
    @statuses = ["Completed", "Pending", "Paid", "Cancelled"]
    @vendors = Vendor.all
  end
end
