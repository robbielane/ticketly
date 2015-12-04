class HomeController < ApplicationController
  def index
    @events = Event.just_added
  end
end
