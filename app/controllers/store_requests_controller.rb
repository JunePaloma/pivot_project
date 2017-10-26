class StoreRequestsController < ApplicationController

  def new
    @request = StoreRequest.new
  end

  def create
    user = set_user
    request = StoreRequest.new(store_request_params)
    update_request(request, user)
    if request.save
      flash[:good_message] = "Successfully submitted a store request"
      redirect_to store_requests_path
    else
      flash[:bad_message] = "Request Failed"
      redirect_to new_store_request_path
    end
  end

  def index
    user = set_user
    @requests = StoreRequest.where(user_id: user.id) if current_user
    @requests = StoreRequest.where(operator_id: user.id) if current_operator
  end

  private

    def store_request_params
      params.require(:store_request).permit(:name, :description)
    end

    def set_user
      return current_user if current_user
      return current_operator if current_operator
    end

    def update_request(request, user)
      request.update(user_id: user.id) if user == current_user
      request.update(operator_id: user.id) if user == current_operator
    end

end