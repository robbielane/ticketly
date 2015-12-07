require 'test_helper'

class RegisteredUserDashboardTest < ActionDispatch::IntegrationTest

  def user_visits_dashboard
    visit root_path
    user = create_and_login_user
    click_on "Logged in as #{user.name}"
    user
  end

  test "registered user can navigate to their dashboard" do
    user = user_visits_dashboard
    assert dashboard_path, current_path
    assert page.has_content?("Welcome, #{user.name}")
  end

  test "registered user can update their account" do
    user = user_visits_dashboard
    assert dashboard_path, current_path
    click_on "Edit Account"
    fill_in "Name", with: "newName"
    fill_in "Username", with: "newUsername"
    fill_in "Password", with: "password"
    click_on "Update Account"
    assert page.has_content?("Account Updated!")
  end

  test "registered user can view order history" do
    user = user_visits_dashboard
    user.orders << Order.create!(status: "Paid", total: 100)
    order_count = user.orders.count
    click_on "Order History"

    assert orders_path, current_path
    assert page.has_content?("Order History")
    assert_equal 1, order_count
  end

  test "registered user can delete account" do
    user = user_visits_dashboard
    user_count = User.count

    assert_equal 3, user_count
    assert dashboard_path, current_path

    click_on "Delete Account"

    assert page.has_content?("Account Deleted!")
    assert_equal User.count, user_count - 1
  end
end

