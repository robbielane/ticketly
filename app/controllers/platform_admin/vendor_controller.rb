class PlatformAdmin::VendorController < PlatformAdmin::BaseController
  before_action :platform_admin?

  def show
    @vendor = Vendor.find(params[:id])
  end
end
