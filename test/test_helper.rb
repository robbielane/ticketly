ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "capybara/rails"
require "mocha/mini_test"
require "minitest/emoji"
SimpleCov.start "rails"

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def create_user
    User.create(username: "cole", name: "Nicole", password: "password")
  end

  def create_and_login_user
    user = create_user
    user.roles << Role.create!(name: "registered_user")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
  end

  def create_tickets(num, activity)
    num.times do |i|
      i += 1
      activity = Activity.find_or_create_by(name: activity)
      activity.tickets.create(name: "Hiking the Alps #{i}",
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

  def platform_admin_login
    user = User.create(name:"jhun", username:"jhun", password:"jhun")
    user.roles << Role.create(name:"platform_admin")
     visit root_path
     click_link "Login"

     fill_in "Username", with: "jhun"
     fill_in "Password", with: "jhun"
  end 

end
