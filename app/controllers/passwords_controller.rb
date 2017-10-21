class PasswordsController < ApplicationController

  def show
  end

  def reset
    user = User.find_by(email: params[:password][:email])
    ConfirmationSender.send_confirmation(user)
    redirect_to new_confirmation_path(user_id: user.id)
  end

  def update
    binding.pry
    
    if User.exists?(verification_code: params[:user][:verification_code])
      user = User.find_by(verification_code: params[:user][:verification_code])
    end

    if passwords_not_empty? && passwords_equal?

    end

  end

  private

    def password_params
      params.require(:user).permit(:password, :password_confirmation, :verification_code)
    end

end