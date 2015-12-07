class VendorAdmin::TicketsController < VendorAdmin::BaseController
  def index
    vendor = Vendor.find(params[:vendor])
    @tickets = vendor.tickets.paginate(page: params[:page], per_page: 21)
  end

  def show
    @ticket = current_user.tickets.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:notice] = "The ticket '#{@ticket.name}' has been created"
      redirect_to vendor_tickets_path
    else
      flash[:notice] = @ticket.errors.full_messages.join(", ")
      redirect_to new_vendor_admin_ticket_path
    end
  end

  def edit
    @ticket = current_user.tickets.find(params[:id])
  end

  def update
    @ticket = current_user.tickets.find(params[:id])
    if @ticket.update(ticket_params)
      flash.notice = "Ticket Updated!"
      redirect_to vendor_admin_tickets_path
    else
      flash.now[:errors] = @ticket.errors.full_messages.join(" ,")
      render :edit
    end
  end

  def destroy
    @ticket = current_user.tickets.find(params[:id])
    @ticket.destroy
    redirect_to vendor_admin_tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :row, :section,:seat, :price)
  end
end
