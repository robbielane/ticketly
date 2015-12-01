class CategoryController < ApplicationController
  def show
    @category = find_category_by_name(params[:category_name])
  end
end
