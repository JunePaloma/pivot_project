class Admin::DashboardController < Admin::BaseController

  def index
    @all_orders = Order.all
    if params[:order_status] == "all"
      @orders = Order.sort.paginate(:page => params[:page], :per_page => 10)
    elsif params[:order_status] == "completed"
      @orders = Order.completed.sort.paginate(:page => params[:page], :per_page => 10)
    elsif params[:order_status] == "paid"
      @orders = Order.paid.sort.paginate(:page => params[:page], :per_page => 10)
    elsif params[:order_status] == "cancelled"
      @orders = Order.cancelled.sort.paginate(:page => params[:page], :per_page => 10)
    elsif params[:order_status] == "ordered"
      @orders = Order.ordered.sort.paginate(:page => params[:page], :per_page => 10)
    else
      @orders = Order.paginate(:page => params[:page], :per_page => 10)
    end
  end

end
