class Admin::StoresController < Admin::BaseController

  def index
    def index
      if current_operator.role == "platform_admin"
        @stores = Stores.all
      else
        store_id_array = current_operator.stores.pluck(:id)
        @stores = Store.where(store_id: store_id_array)
      end
    end
  end

  def edit
  end

  def update
  end

end
