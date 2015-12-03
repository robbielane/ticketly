class Admin::TicketsController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    category= Category.find_or_create_by(name: params[:ticket][:category])
    @ticket = category.tickets.new(ticket_params)
    if @ticket.save
      flash[:notice] = "The ticket '#{@ticket.name}' has been created"
      redirect_to admin_tickets_path
    else
      flash[:notice] = @ticket.errors.full_messages.join(", ")
      redirect_to new_admin_ticket_path
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      flash.notice = "Ticket Updated!"
      redirect_to admin_tickets_path
    else
      flash.now[:errors] = @pursuit.errors.full_messages.join(" ,")
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def ticket_params
    params.require(:pursuit).permit(:name, :row, :section,:seat, :price)
  end
end
