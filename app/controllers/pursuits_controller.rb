class PursuitsController < ApplicationController
  before_action :require_admin, only: [:new, :create]

  def index
    @activities = Activity.all
  end

  def show
    @pursuit = Pursuit.find(params[:id])
  end

  def new
    @pursuit = Pursuit.new
  end

  def create
    activity = Activity.find_or_create_by(name: params[:pursuit][:activity])
    @pursuit = activity.pursuits.new(pursuit_params)
    if @pursuit.save
      flash[:notice] = "The pursuit '#{@pursuit.name}' has been created"
      redirect_to @pursuit
    else
      flash[:notice] = @pursuit.errors.full_messages.join(", ")
      redirect_to new_pursuit_path
    end
  end

  private

  def pursuit_params
    params.require(:pursuit).permit(:name, :description, :price)
  end
end
