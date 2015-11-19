class AdminController < ApplicationController
  before_action :require_admin

  def dashboard
    @admin = current_user
    @statuses = ["Completed", "Pending", "Paid", "Cancelled"]
  end
end
