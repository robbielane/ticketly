class PermissionService
  extend Forwardable
  attr_reader :user, :controller, :action

  def_delegators :user, :platform_admin?, :store_admin?, :registered_user?

  def initialize(user)
    @user = user|| User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    case
    when platform_admin? then platform_admin_permissions
    when store_admin? then store_admin_permissions
    when registered_user? then registered_user_permission
    else
      general_permissions
    end
  end

  private

  def store_admin_permissions
    #this doesnt exist yet
    # return true if controller == "sessions"   && action.in?(%w(new create delete))
    # return true if controller == "home"       && action == "index"
    # return true if controller == "tickets"    && action.in?(%w(index show))
    # return true if controller == "users"      && action.in?(%w(index show))
    # return true if controller == "orders"     && action.in?(%w(index show))
    # return true if controller == "events"     && action.in?(%w(index))
    # return true if controller == "category"   && action.in?(%w(show))
  end


  def platform_admin_permissions
    return true if controller == "sessions"                 && action.in?(%w(new create delete))
    return true if controller == "home"                     && action.in?(%w(index show))
    return true if controller == "admin/tickets"            && action.in?(%w(new update create edit delete index show))
    return true if controller == "admin/orders"             && action.in?(%w(update index show))
    return true if controller == "orders"                   && action.in?(%w(show create index))
    return true if controller == "tickets"                  && action.in?(%w(index show))
    return true if controller == "events"                   && action.in?(%w(index show))
    return true if controller == "category"                 && action.in?(%w(show))
    return true if controller == "admin"                    && action.in?(%w(dashboard))
    return true if controller == "users"                    && action.in?(%w(edit update))

  end

  def registered_user_permission
    return true if controller == "sessions"       && action.in?(%w(new create delete))
    return true if controller == "home"           && action == "index"
    return true if controller == "tickets"        && action.in?(%w(index show))
    return true if controller == "events"         && action.in?(%w(index show))
    return true if controller == "category"       && action.in?(%w(show))
    return true if controller == "cart_tickets"   && action.in?(%w(create show update delete))
  end

  def general_permissions
    return true if controller == "sessions"   && action.in?(%w(new create delete))
    return true if controller == "home"       && action == "index"
    return true if controller == "tickets"    && action.in?(%w(index show))
    return true if controller == "events"     && action.in?(%w(index show))
    return true if controller == "category"   && action.in?(%w(show))
    return true if controller == "users"      && action.in?(%w(new create))

  end
end