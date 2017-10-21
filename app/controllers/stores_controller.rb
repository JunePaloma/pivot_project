class StoresController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @stores = Store.all
  end

  def show
    unless @store = Store.find_by(slug: params[:store_slug])
      render file: "/public/404"
    end
  end
end
