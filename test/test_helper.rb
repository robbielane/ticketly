ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "capybara/rails"
require "mocha/mini_test"
require "minitest/pride"

class ActiveSupport::TestCase
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def create_user
    User.create(username: "cole", name: "Nicole", password: "password")
  end

  def create_and_login_user
    user = create_user

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
  end

  def create_pursuits(num, activity)
    num.times do |i|
      i += 1
      activity = Activity.find_or_create_by(name: activity)
      activity.pursuits.create(name: "Hiking the Alps #{i}",
                               description: "Go hike the alps! #{i}",
                               price: 1000 + i)
    end
  end

  def add_items_to_cart(num)
    num.times do |i|
      i += 1
      create_pursuits(1, "Hiking #{i}")
      pursuit = Activity.find_by_name("Hiking #{i}").pursuits.first

      visit pursuit_path(pursuit)
      click_link "Purchase Trip"

      fill_in "travellers", with: i
      click_button "Place Order"
    end
  end

  def checkout_user(num_items)
    create_and_login_user
    add_items_to_cart(num_items)
    visit "/cart"
    click_button "Checkout"
  end

  def teardown
    reset_session!
  end

  def login_admin
    User.create(username: "admin", name: "Admin", password: "password", role: 1)

    visit login_path
    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"
    click_button "Login"
  end
end
