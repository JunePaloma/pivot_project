class StoreRequestsController < ApplicationController

  def new
    @request = StoreRequest.new
  end

end