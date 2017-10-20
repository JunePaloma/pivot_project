class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find_by_name(params[:category_name])
  end
end
