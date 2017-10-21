class WelcomeController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @categories = Category.all
    @stores     = Store.all
  end
end
