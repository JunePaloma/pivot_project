
class Admin::OrdersController < Admin::BaseController

  def show
    @order = Order.find(params[:id])
  end

  def index
    store = Store.find(current_operator.store_id)
    @orders = store.find_orders
  end
end
