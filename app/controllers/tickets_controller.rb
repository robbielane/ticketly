class TicketsController < ApplicationController
  def index
    if params[:query].present?
      @ticket = Ticket.search(params[:query], id: params[:id])
    else
      @categories = Category.all
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
