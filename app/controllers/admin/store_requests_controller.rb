class Admin::StoreRequestsController < Admin::BaseController

  def index
    @requests = StoreRequest.all
  end

  def decline
    request = StoreRequest.find(params[:store_request_id])
    if StoreRequestConverter.new(request).declined
      flash[:good_message] = "Store Request #{request.id} declined!"
      redirect_to admin_store_requests_path
    end
  end

  def approve
    request = StoreRequest.find(params[:store_request_id])
    if StoreRequestConverter.new(request).approved
      flash[:good_message] = "Created Store #{request.name}."
      redirect_to admin_store_requests_path
    end
  end

  private

    def user_or_operator(request)
      return request.operator if request.operator
      return request.user if request.user
    end

end