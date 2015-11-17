class Admin::PursuitsController < Admin::BaseController

  def index
    @activities = Activity.all
  end

  def show
    @pursuit = Pursuit.find(params[:id])
  end

  def new
    @pursuit = Pursuit.new
  end

  def create
    activity = Activity.find_or_create_by(name: params[:pursuit][:activity])
    @pursuit = activity.pursuits.new(pursuit_params)
    if @pursuit.save
      flash[:notice] = "The pursuit '#{@pursuit.name}' has been created"
      redirect_to @pursuit
    else
      flash[:notice] = @pursuit.errors.full_messages.join(", ")
      redirect_to new_pursuit_path
    end
  end

  def edit
    @pursuit = Pursuit.find(params[:id])
  end

  def update
    @pursuit = Pursuit.find(params[:id])
    if @pursuit.update(pursuit_params)
      flash.notice = "Pursuit Updated!"
      redirect_to admin_pursuits_path
    else
      flash.now[:errors] = @pursuit.errors.full_messages.join(" ,")
      render :edit
    end
  end

  def destroy
    @pursuit = Pursuit.find(params[:id])
    @pursuit.destroy
    redirect_to admin_pursuits_path
  end

  private

  def pursuit_params
    params.require(:pursuit).permit(:name, :description, :price)
  end
end
