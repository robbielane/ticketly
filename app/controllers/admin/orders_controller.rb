class Admin::PursuitsController < Admin::BaseController
  before_action :set_up

  def set_up
    @admin = current_user
    @pursuit = Pursuit.new
  end
end
