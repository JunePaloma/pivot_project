class Api::V1::MerchantsController < Api::V1::ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::MimeResponds
  before_action :restrict_access

  def index
    merchants = Store.all
    render json: merchants
  end

  private

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end
end
