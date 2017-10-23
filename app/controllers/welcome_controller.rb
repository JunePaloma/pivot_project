class WelcomeController < ApplicationController

  def index
    @categories = Category.all
    @stores     = Store.all
  end
end
