class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if current_vendor?
        redirect_to "/#{@user.vendor.name.parameterize}/dashboard"
      else
        redirect_to dashboard_path
      end
    else
      flash[:errors] = "Invalid login credentials"
      redirect_to login_path
    end
  end

  def delete
    reset_session
    redirect_to login_path
  end
end
