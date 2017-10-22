class StoreAdmin::BaseController < ApplicationController
before_action :require_store_admin

  def require_store_admin
    render file: "public/404", layout: false unless @current_operator.role == 1
  end
end
