class Api::V1::AuthenticationController < Api::ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUSer.call(params[:username], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
