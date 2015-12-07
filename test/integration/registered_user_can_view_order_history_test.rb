require 'test_helper'

class RegisteredCanViewOrderHistoryTest < ActionDispatch::IntegrationTest

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

  test "registered user can view order history" do
    user = user_visits_dashboard
    user.orders << Order.create!(status: "Paid", total: 100)
    order_count = user.orders.count
    click_on "Order History"

    assert orders_path, current_path
    assert page.has_content?("Order History")
    assert_equal 1, order_count
  end
end

