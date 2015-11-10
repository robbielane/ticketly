class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :format_url_name
  before_action :set_cart

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def format_url_name(name)
    name.downcase.gsub(" ", "_")
  end

  def find_activity_by_name(name)
    formatted_name = name.tr("_"," ").titleize
    Activity.find_by_name(formatted_name)
  end
end
