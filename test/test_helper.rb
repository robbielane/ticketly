ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "capybara/rails"

class ActiveSupport::TestCase

end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def create_pursuits(num)
    num.times do |i|
      i += 1
      activity = Activity.find_or_create_by(name: "Hiking #{i}")
      activity.pursuits.create(name: "Hiking the Alps #{i}",
                               description: "Go hike the alps! #{i}",
                               price: 1000 + i)
    end
  end
end
