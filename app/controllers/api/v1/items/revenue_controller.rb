class Api::V1::Items::RevenueController < Api::V1::ApplicationController

  def index
    require 'pry'; binding.pry
    render json: Item.top_items(params[:quantity])
  end
end
