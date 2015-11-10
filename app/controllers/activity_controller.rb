class ActivityController < ApplicationController
  def show
    @activity = find_activity_by_name(params[:activity_name])
  end
end
