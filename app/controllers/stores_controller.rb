class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def show
    require 'pry'; binding.pry
    @store = Store.find_by(slug: params[:slug])
  end
end
