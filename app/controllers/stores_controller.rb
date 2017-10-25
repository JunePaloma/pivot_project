class StoresController < ApplicationController

  def index
    @stores = Store.all
    binding.pry
  end

  def show
    unless @store = Store.find_by(slug: params[:store_slug])
      render file: "/public/404"
    end
  end
end
