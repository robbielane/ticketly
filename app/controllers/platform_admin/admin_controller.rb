class PlatformAdmin::AdminController < PlatformAdmin::BaseController
  before_action :platform_admin?

  def dashboard
    @statuses = ["Active", "Inactive"]
    @vendors = Vendor.all
  end
end
