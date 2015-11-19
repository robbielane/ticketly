class PursuitsController < ApplicationController
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
