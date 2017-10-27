class Admin::StoresController < Admin::BaseController

  def index
    if current_operator.role == "platform_admin"
      @stores = Store.all
    else
      store_id_array = current_operator.stores.pluck(:id)
      @stores = Store.where(id: store_id_array)
    end
  end

  def edit
  end

  def update
  end

end
