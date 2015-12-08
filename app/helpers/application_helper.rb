module ApplicationHelper
  def login_logout_path
    if current_user
      link_to "Logout", logout_path
    else
      link_to "Login", login_path
    end
  end

  def cart_display
    link_to "Cart: #{count_of_trips}", cart_path
  end

  def join_dashboard_path
    if current_vendor?
      link_to "Logged in as #{current_user.name}", vendor_dashboard_path(current_user)
    elsif current_user
      link_to "Logged in as #{current_user.name}", dashboard_path
    else
      link_to "Join", new_user_path
    end
  end

  def format_currency(price)
    number_to_currency(price, unit: "$")[0...-3]
  end

  def format_date(date)
    date.strftime("%B %d, %Y")
  end

  def format_time(date)
    date.strftime("%H:%M")
  end

  def format_date_and_time(date)
    "#{format_date(date)} at #{format_time(date)}"
  end

  def role_assignment(params, user)
    if params[:role] == nil 
      user.roles << Role.find_by(name: "registered_user")
    end
    if params[:role] == "1"
      user.roles << Role.find_by(name: "vendor_admin")
      Vendor.create!(user_id: user.id, name: user.name)
    end
  end

  def redirect_router(user)
    if user.vendor_admin?
      redirect_to vendor_dashboard_path(user)
    else
      redirect_to dashboard_path 
    end
  end
end
