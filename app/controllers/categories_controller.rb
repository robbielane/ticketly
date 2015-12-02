class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @events   = @category.events
  end
end
