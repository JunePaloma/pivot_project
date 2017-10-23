class PermissionsService
  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def authorized?
    return true if controller == "stores" && action == "index"
    return true if controller == "sessions" && action.in?(["new", "create", "destroy"])

    if user.platform_admin?
      platform_admin_permissions
    elsif user.business_admin?
      business_admin_permissions
    elsif
    elsif user.registered?
      return true if controller == "user" && action.in?(%w(index))
      return true if controller == "user" && action.in?(%w(index show))
    else
    return false
    end
  end

  private

  attr_reader: :user, :controller, :action

  def platform_admin_permissions
    return true if controller == "dashboard" && action == "index"
    return true if controller == "stores" && action.in?(%w(new create destroy)
  end

  def business_admin_permissions
    return true if controller == "stores" && action.in?(%w(edit update))
    return true if controller == "operators" && action.in?(%w(new create edit update destroy))
    
  end



end
