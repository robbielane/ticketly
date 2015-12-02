class TicketsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
