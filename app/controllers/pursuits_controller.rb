class PursuitsController < ApplicationController
  def index
    @pursuits = Pursuit.all
  end
end
