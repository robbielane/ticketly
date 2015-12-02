class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @event    = @category.events
  end
end
