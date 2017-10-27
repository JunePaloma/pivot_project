class Admin::DashboardController < Admin::BaseController

  def index
    @all_orders = Order.all
    if current_operator.role == "platform_admin"
      @orders = filter_orders(params[:order_status])
    else
      @orders = filter_orders_by_store(params[:order_status], params[:store_id])
    end
  end
end
