class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user
  helper_method :current_operator
  helper_method :current_admin?
  helper_method :current_store
  before_action :set_new_user



  def set_new_user
    @new_user = User.new
  end

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_operator
    @current_operator ||= Operator.find(session[:operator_id]) if session[:operator_id]
  end

  def require_current_user
    render file: "/public/404" unless current_user
  end

  def current_admin?
    current_operator
    @current_operator != nil
  end

  private

    def authorize!
      user = find_user
        permission = PermissionsService.new(user, params[:controller], params[:action])
      raise ActionController::RoutingError.new("Not Found") unless permission.authorized?
    end

    def find_user
      if @current_operator
        return @current_operator
      elsif @current_user
        return @current_user
      end   
    end

end
