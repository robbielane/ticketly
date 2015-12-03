class VendorAdmin::BaseController < ApplicationController
  before_action :require_vendor_admin
end
