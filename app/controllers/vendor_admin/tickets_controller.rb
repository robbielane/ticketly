class VendorAdmin::TicketsController < VendorAdmin::BaseController
  def index
    vendor = Vendor.find_by(slug: params[:vendor])
    @tickets = vendor.tickets.paginate(page: params[:page], per_page: 21)
  end

  def show
    @ticket = current_user.tickets.find(params[:id])
  end

  def new
    vendor = Vendor.find_by(slug: params[:vendor])
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.new
  end

  def create
    vendor = Vendor.find(params[:vendor])
    @ticket = vendor.tickets.new(ticket_params)
    if @ticket.save
      flash[:notice] = "The ticket for '#{@ticket.event.name}' has been created"
      redirect_to vendor_tickets_path(current_user.vendor.slug)
    else
      flash[:notice] = @ticket.errors.full_messages.join(", ")
      redirect_to new_vendor_admin_ticket_path
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket Updated!"
      redirect_to vendor_tickets_path(current_user.vendor.slug)
    else
      flash.now[:errors] = @ticket.errors.full_messages.join(" ,")
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.destroy(params[:id])
    @ticket.destroy
    redirect_to vendor_tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:row, :section,:seat, :price, :event_id)
  end
end
