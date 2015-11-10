class PursuitsController < ApplicationController
  def index
    @activities = Activity.all
  end
end
