class EventsController < ApplicationController
  def index
    @events = Event.all.paginate(page: params[:page], per_page: 20)
  end

  def show
    @event = Event.find(params[:id])
  end
end
