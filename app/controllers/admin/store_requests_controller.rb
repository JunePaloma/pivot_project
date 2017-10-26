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
      flash[:good_message] = "Created Store #{request.name} and Admin #{request.user.name}."
      redirect_to admin_store_requests_path
    end
  end

end