class PlatformAdmin::BaseController < ApplicationController
  before_action :platform_admin?
end
