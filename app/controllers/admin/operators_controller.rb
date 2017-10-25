class Admin::OperatorsController < ApplicationController
  def new
  end

  def create
  end

  def edit
   if current_operator.id != params[:id].to_i
     render file: "/public/404"
   end
  end

  def update
    if current_operator.update(operator_params)
      flash[:good_message] = "You've successfully updated your Account"
      redirect_to admin_dashboard_index_path
    else
      flash[:bad_message] = "Update failed"
      redirect_to edit_admin_user_path(current_operator)
    end
  end

  def destroy
  end
  private

  def operator_params
    params.require(:operator).permit(:user_name, :name, :password)
  end

end
