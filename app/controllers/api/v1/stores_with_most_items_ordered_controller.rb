class Api::V1::StoresWithMostItemsOrderedController < Api::V1::ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :restrict_access

  def index
    render json: Store.most_items_sold
  end

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ENV['API_KEY'] == token
    end
  end
end
