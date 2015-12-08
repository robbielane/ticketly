class VendorAdmin::BaseController < ApplicationController
  before_action :current_vendor?
end
