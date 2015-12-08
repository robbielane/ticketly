class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if current_vendor?
        redirect_to vendor_dashboard_path(@user)
      elsif platform_admin?
        redirect_to platform_admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    else
      flash.now[:error] = "Invalid login credentials"
      render :new
    end
  end

  def delete
    reset_session
    redirect_to login_path
  end
end
