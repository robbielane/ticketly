class EventsController < ApplicationController
  def index
    if params[:query].present?
      @events = Event.search(params[:query], name: params[:name])
                     .paginate(page: params[:page], per_page: 20)
    else
      @events = Event.all.paginate(page: params[:page], per_page: 20)
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
