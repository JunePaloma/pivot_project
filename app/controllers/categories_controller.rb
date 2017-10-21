class CategoriesController < ApplicationController
  skip_before_action :authenticate_request

  def show
    @category = Category.find_by_name(params[:category_name])
  end
end
