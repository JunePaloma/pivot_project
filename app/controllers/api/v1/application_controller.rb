class Api::V1::ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :restrict_access


  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ENV['API_KEY'] == token
      # ApiKey.exists?(access_token: token)
    end
  end

end
