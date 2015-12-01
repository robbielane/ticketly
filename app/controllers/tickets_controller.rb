class TicketsController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
