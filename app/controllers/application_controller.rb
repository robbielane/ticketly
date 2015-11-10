class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :format_url_name

  def format_url_name(name)
    name.downcase.gsub(" ", "_")
  end
end
