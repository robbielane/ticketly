class VendorAdmin::EventsController < VendorAdmin::BaseController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.parse_date_time(params[:event][:date_time])
    if @event.save
      flash[:notice]= "Your event has been created."
      redirect_to new_vendor_ticket_path(event_id: @event.id)
    else
      flash.now[:errors]= ":[]"
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location_city, :location_state, :date_time, :venue, :category_id, :street_address)
  end
end
