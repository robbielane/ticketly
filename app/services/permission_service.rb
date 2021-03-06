class PermissionService
  extend Forwardable
  attr_reader :user, :controller, :action

  def_delegators :user, :platform_admin?, :vendor_admin?, :registered_user?

  def initialize(user)
    @user = user|| User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    case
    when platform_admin? then platform_admin_permissions
    when vendor_admin? then vendor_admin_permissions
    when registered_user? then registered_user_permission
    else
      general_permissions
    end
  end

  private

  def vendor_admin_permissions
    return true if controller == "sessions"                 && action.in?(%w(new create delete))
    return true if controller == "home"                     && action.in?(%w(index show))
    return true if controller == "vendor_admin/vendor"      && action.in?(%w(dashboard select_event))
    return true if controller == "vendor_admin/events"      && action.in?(%w(new create autocomplete_event_name))
    return true if controller == "vendor_admin/orders"      && action.in?(%w(show update index))
    return true if controller == "orders"                   && action.in?(%w(show create index))
    return true if controller == "vendor_admin/tickets"     && action.in?(%w(index create edit new update show destroy))
    return true if controller == "tickets"                  && action.in?(%w(index show))
    return true if controller == "events"                   && action.in?(%w(index show autocomplete_event_name))
    return true if controller == "category"                 && action.in?(%w(show))
    return true if controller == "admin"                    && action.in?(%w(dashboard))
    return true if controller == "users"                    && action.in?(%w(new destroy edit update create))
    return true if controller == "cart_tickets"             && action.in?(%w(create show update delete))
    return true if controller == "vendors"                  && action.in?(%w(index show))
    return true if controller == "qr"                       && action.in?(%w(show image))
  end


  def platform_admin_permissions
    return true if controller == "platform_admin/admin"     && action.in?(%w(dashboard))
    return true if controller == "platform_admin/vendor"    && action.in?(%w(show edit update))
    return true if controller == "sessions"                 && action.in?(%w(new create delete))
    return true if controller == "home"                     && action.in?(%w(index show))
    return true if controller == "orders"                   && action.in?(%w(show create index))
    return true if controller == "tickets"                  && action.in?(%w(index show))
    return true if controller == "events"                   && action.in?(%w(index show autocomplete_event_name))
    return true if controller == "category"                 && action.in?(%w(show))
    return true if controller == "admin"                    && action.in?(%w(dashboard))
    return true if controller == "users"                    && action.in?(%w(new destroy dashboard edit update))
    return true if controller == "cart_tickets"             && action.in?(%w(create show update delete))
    return true if controller == "vendors"                  && action.in?(%w(index show))
    return true if controller == "qr"                       && action.in?(%w(show image))
  end

  def registered_user_permission
    return true if controller == "sessions"       && action.in?(%w(new create delete))
    return true if controller == "home"           && action == "index"
    return true if controller == "tickets"        && action.in?(%w(index show))
    return true if controller == "events"         && action.in?(%w(index show autocomplete_event_name))
    return true if controller == "category"       && action.in?(%w(show))
    return true if controller == "cart_tickets"   && action.in?(%w(create show update delete))
    return true if controller == "orders"         && action.in?(%w(create show index))
    return true if controller == "users"          && action.in?(%w(new dashboard edit update destroy))
    return true if controller == "vendors"        && action.in?(%w(index show))
    return true if controller == "qr"             && action.in?(%w(show image))
  end

  def general_permissions
    return true if controller == "sessions"       && action.in?(%w(new create delete))
    return true if controller == "home"           && action == "index"
    return true if controller == "tickets"        && action.in?(%w(index show))
    return true if controller == "events"         && action.in?(%w(index show autocomplete_event_name))
    return true if controller == "category"       && action.in?(%w(show))
    return true if controller == "users"          && action.in?(%w(new create))
    return true if controller == "cart_tickets"   && action.in?(%w(create show update delete))
    return true if controller == "orders"         && action.in?(%w(create new))
    return true if controller == "vendors"        && action.in?(%w(index show))
    return true if controller == "qr"             && action.in?(%w(show image))
  end
end
