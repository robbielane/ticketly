class PlatformAdmin::AdminController < PlatformAdmin::BaseController
  before_action :platform_admin?

  def dashboard
    @statuses = ["active", "inactive"]
    @vendors = Vendor.all
  end
end
