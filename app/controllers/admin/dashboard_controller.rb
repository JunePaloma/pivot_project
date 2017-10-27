class Admin::DashboardController < Admin::BaseController

  def index
    @store = Store.find(params[:store_id])
    @orders = Order.filter_orders_by_store(params[:order_status], params[:store_id], params[:page])
  end
end
