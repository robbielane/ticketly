class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize!
  before_action :set_cart
  helper_method :count_of_trips, :current_user, :current_vendor?,
                :platform_admin?

  def current_permission
    @current_permission ||= PermissionService.new(current_user)
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_vendor?
    current_user && current_user.vendor_admin?
  end

  def platform_admin?
    current_user && current_user.platform_admin?
  end

  def find_category_by_name(name)
    formatted_name = name.tr("_"," ").titleize
    Category.find_by_name(formatted_name)
  end

  def count_of_trips
    @cart.total_tickets
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin
    render file: "./test/public/404" unless current_admin
  end

  def authorize!
    unless authorized?
      flash[:auth] = "you are not authorized to view this content."
      redirect_to root_url
    end
  end

  def authorized?
    current_permission.allow?(params[:controller], params[:action])
  end
end
