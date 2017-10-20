class PasswordsController < ApplicationController

  def show
  end

  def reset
    user = User.find_by(email: params[:password][:email])
    ConfirmationSender.send_confirmation(user)
    redirect_to new_confirmation_path
  end

end