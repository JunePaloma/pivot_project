class Api::V1::MerchantsController < Api::V1::ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :restrict_access

  def index
    merchants = Store.all
    render json: merchants
  end

  private

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ENV['API_KEY'] == token
        # ApiKey.exists?(access_token: token)
      end
    end
end
