class AdminController < ApplicationController
  before_action :require_admin

  def dashboard
    @admin = current_user
  end
end
