class Admin::UsersController < Admin::BaseController

  def edit
   if current_operator.id != params[:id].to_i
     render file: "/public/404"
   end
  end

  def update
    if current_operator.update(params)
      flash[:good_message] = "You've successfully updated your Account"
      redirect_to admin_dashboard_index_path
    else
      flash[:bad_message] = "Update failed"
      redirect_to edit_admin_user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:operator).permit(:user_name, :name, :password)
  end

end
