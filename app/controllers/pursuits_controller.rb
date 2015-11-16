class PursuitsController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @pursuit = Pursuit.find(params[:id])
  end

  def new
    @pursuit = Pursuit.new
  end
end
