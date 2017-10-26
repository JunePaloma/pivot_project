class StoreRequestsController < ApplicationController

  def new
    @requests = StoreRequest.new
  end

end