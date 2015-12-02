class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :format_url_name,
                :count_of_trips,
                :pursuits_in_cart,
                :current_user,
                :current_admin,
                :category_list

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def format_url_name(name)
    name.downcase.gsub(" ", "_")
  end

  def find_category_by_name(name)
    formatted_name = name.tr("_"," ").titleize
    Category.find_by_name(formatted_name)
  end

  def count_of_trips
    @cart.total_trips
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.role == 1
  end

  def require_admin
    render file: "./test/public/404" unless current_admin
  end

  def category_list
    Category.all
  end
end
