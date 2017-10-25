
class Admin::OrdersController < Admin::BaseController

  def show
    @order = Order.find(params[:id])
  end

  def index
    stores = Store.where(id: current_operator.store_id)
    @orders = stores.find_orders
  end
end
