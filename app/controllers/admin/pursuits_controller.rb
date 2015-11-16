class Admin::PursuitsController < Admin::BaseController
  before_action :set_up

  def set_up
    @admin = current_user
    @pursuit = Pursuit.new
  end

  def new
  end

  private

  def pursuit_params
    params.require(:pursuit).permit(:name, :description, :price)
  end
end
