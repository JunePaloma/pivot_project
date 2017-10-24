class PermissionsService
  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def authorized?


    if user.platform_admin?
      platform_admin_permissions

    elsif user.business_admin?
      business_admin_permissions
    elsif user.registered?
      all_visitor_permissions
      registered_user_permissions
    else
    return false
    end
  end

  private

  attr_reader: :user, :controller, :action

  def all_visitor_permissions
    return true if controller == "welcome"
    return true if controller == "stores"
    return true if controller == "sessions" && action.in?(["new", "create", "destroy"])
    return true if controller == "carts"
    return true if controller == "categories"
    return true if controller == "items"
    return true if controller == "users" && action.in?(["new", "create"])
  end

  def platform_admin_permissions
    return true if controller == "dashboard" && action == "index"
    return true if controller == "stores" && action.in?(%w(new create destroy)
  end

  def business_admin_persmissions
    return true if controller == "admin/stores" && action.in?(%w(edit update))
    return true if controller == "admin/operators" && action.in?(%w(new create edit update destroy))
  end

  def business_manager_permissions
    return true if controller == "orders" && action.in?(["cancel", "paid", "completed"])
    return true if controller == "operatorsesh"
    return true if controller == "admin/stores"
    return true if controller == "admin/dashboard"

  end

  def registered_user_permissions
    return true if controller == "orders" && action.in?(["index", "show", "create"])
    return true if controller == "user" && action.in?(%w(edit update))
  end

end
