class SessionsController < ApplicationController

  def new
  end

  def create

    default_login? ? user = default_login_info : user = oauth_login_info
    if user
      flash[:good_message] =  "Login Successful"
      session[:user_id] = user.id
      redirect_back(fallback_location: root_path)
    else
      flash[:bad_message] = "Login Unsuccessful"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
  def authenticated?(user)
    user && user.authenticate(params[:session][:password])
  end

  def default_login?
    params[:session]
  end

  def default_login_info
    user = User.find_by(username: params[:session][:username])
    if user && authenticated?(user)
      user
    end
  end

  def oauth_login_info
    User.from_oauth(request.env["omniauth.auth"])
  end

end
