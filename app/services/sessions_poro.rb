class SessionsPoro
  def initialize(user)
    @user_params = user_params
  end

  def default_login
    @user = User.find_by(username: @user_params[:session][:username])
    if authenticated?(@user) && @user.user?
      flash[:good_message] =  "Login Successful"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    elsif authenticated?(@user) && @user.admin?
      flash[:good_message] =  "Login Successful"
      session[:user_id] = @user.id
      redirect_to admin_dashboard_index_path
    else
      flash[:bad_message] = "Login Unsuccessful"
      redirect_back(fallback_location: root_path)
    end
  end

  def oauth_login
  end

end
