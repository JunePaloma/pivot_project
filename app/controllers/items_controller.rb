class ItemsController < ApplicationController
  skip_before_action :authenticate_request
  before_action :set_item, only: [:show]

  def index
    @items = Item.all
  end

  def show
  end


  private

    def set_item
      @item = Item.find(params[:id])
    end

end
