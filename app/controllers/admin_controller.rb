class AdminController < ApplicationController
  before_action :require_admin

  def dashboard
    @admin = current_user
    @statuses = ["Completed", "Pending", "Paid", "Cancelled"]
  end

  private

  def button_update_status(order)
    if order.status == "Paid" || "Ordered"
      link_to( "Cancel", )
    elsif order.status == "Ordered"
      link_to( "Paid", )
    else order.status == "Paid"
      link_to( "Completed", )
    end
  end
end
