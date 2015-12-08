class VendorAdmin::VendorController < ApplicationController
  def dashboard
    @statuses = ["Completed", "Pending", "Paid", "Cancelled"]
    @vendor = Vendor.find_by(user_id: current_user.id)
    @orders = @vendor.orders
  end

  def select_event
    if params[:query].present?
      @events = Event.current.search(params[:query], name: params[:name])
    else
      @events = Event.current.paginate(page: params[:page], per_page: 20)
    end
  end
end
