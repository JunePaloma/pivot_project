class StoreRequestsController < ApplicationController

  def new
    @request = StoreRequest.new
  end

  def create
    user = current_user || current_operator
    request = StoreRequest.new(store_request_params)
    request.update(user_id: user.id)
    if request.save
      flash[:good_message] = "Successfully submitted a store request"
      redirect_to store_requests_path
    else
      flash[:bad_message] = "Request Failed"
      redirect_to new_store_request_path
    end
  end

  def index
    user = current_user || current_operator
    @requests = StoreRequest.where(user_id: user.id)
  end

  private

    def store_request_params
      params.require(:store_request).permit(:name, :description)
    end

end