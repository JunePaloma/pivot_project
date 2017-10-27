class Admin::DashboardController < Admin::BaseController

  def index
    if current_operator.role == "platform_admin"
      @orders = Order.filter_orders(params[:order_status])
    else
      @orders = Order.filter_orders_by_store(params[:order_status], params[:store_id], params[:page])
    end
  end
end
