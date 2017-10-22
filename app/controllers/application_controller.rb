class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user
  helper_method :current_admin?
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
  #
  # def set_new_operator
  #   @new_operator = StoreOperator.new
  # end

  def current_operator
    @current_operator ||= StoreOperator.find(operatorsesh[:operator_id]) if operatorsesh[:operator_id]

  end

  def require_current_user
    render file: "/public/404" unless current_user
  end

  def current_admin?
    current_user && store_operator
  end
end
