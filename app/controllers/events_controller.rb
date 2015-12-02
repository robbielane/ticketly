class EventsController < ApplicationController
  def index
    if params[:query].present?
      @events = Event.search(params[:query], name: params[:name])
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
