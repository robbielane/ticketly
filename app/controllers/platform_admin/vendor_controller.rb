class PlatformAdmin::VendorController < PlatformAdmin::BaseController
  before_action :platform_admin?

  def show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
      flash.notice = "Vendor Updated!"
      redirect_to platform_admin_dashboard_path
    else
      flash.now[:errors] = @vendor.errors.full_messages.join(" ,")
      render :edit
    end
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :status, :user_id)
  end
end
