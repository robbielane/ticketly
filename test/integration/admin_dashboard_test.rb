require 'test_helper'

class AdminDashboardTest < ActionDispatch::IntegrationTest

  test "Admin can login and access admin dashboard path" do
    User.create(username: "aaron", name: "Aaron", password: "pass", role: 1)

    visit root_path

    fill_in "Username", with: "aaron"
    fill_in "Password", with: "pass"

    click_button "Login"
    assert admin_dashboard_path, current_path
    assert page.has_content?("Admin Dashboard")
  end

  test "Admin sees content on admin dashboard" do
    skip
    # As an Admin
    # When I visit "/admin/dashboard"
    # I will see a heading on the page that says "Admin Dashboard"
    # As a registered user
    # When I visit "/admin/dashboard"
    # I get a 404
    # As an unregistered user
    # When I visit "/admin/dashboard"
    # I get a 404
  end
end
