class HomeController < ApplicationController
  def index
    @events = Event.all.limit(6)
  end
end
