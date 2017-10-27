class Admin::OperatorsController < ApplicationController
  def new
    render file: "/public/404" unless approved_user?
    @store = Store.find_by(slug: params[:store_name])
    @operator = Operator.new
  end

  def create
    store = Store.find(params[:store_id])
    @operator = Operator.create(operator_params)
    add_store_to(@operator, store)
    if @operator.save
      session[:operator] = @operator.id
      flash[:good_message] = "Successful Account Creation"
      redirect_to admin_dashboard_index_path
    else
      redirect_to new_admin_operator_path(store_name: @store.name.parameterize)
    end
  end

  def edit
   if current_operator.id != params[:id].to_i
     render file: "/public/404"
   end
  end

  def update
    if current_operator.update(operator_params)
      flash[:good_message] = "You've successfully updated your Account"
      redirect_to admin_stores_path
    else
      flash[:bad_message] = "Update failed"
      redirect_to edit_admin_user_path(current_operator)
    end
  end

  def destroy
  end

  private

  def operator_params
    params.require(:operator).permit(:user_name, :name, :password, :email)
  end

  def add_store_to(operator, store)
    operator.stores << store
  end

  def approved_user?
    if current_user.store_requests.pluck(:status).include?("approved")
      return true
    else
      return false
    end
  end

end
