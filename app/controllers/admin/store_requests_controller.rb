class Admin::StoreRequestsController < Admin::BaseController

  def index
    @requests = StoreRequest.all
  end

end