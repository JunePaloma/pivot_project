class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
    render :layout => false
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      redirect_to edit_admin_item_path(@item)
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :image_path, :active)
  end

end
