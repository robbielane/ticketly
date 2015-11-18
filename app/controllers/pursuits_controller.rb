class PursuitsController < ApplicationController
  # before_action :require_admin, only: [:new, :create]

  def index
    @activities = Activity.all
  end

  def show
    @pursuit = Pursuit.find(params[:id])
  end

  private

  def pursuit_params
    params.require(:pursuit).permit(:name, :description, :price, :image)
  end
end
