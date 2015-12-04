class EventsController < ApplicationController
  autocomplete :event, :name
  
  def index
    if params[:query].present?
      @events = Event.search(params[:query], name: params[:name])
    else
      @events = Event.all.paginate(page: params[:page], per_page: 20)
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
