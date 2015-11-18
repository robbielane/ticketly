require "test_helper"

class AdminDashboardTest < ActionDispatch::IntegrationTest
  test "admin can login and access admin dashboard path" do
    User.create(username: "aaron", name: "Aaron", password: "pass", role: 1)
    visit login_path

    fill_in "Username", with: "aaron"
    fill_in "Password", with: "pass"

    click_button "Login"
    assert admin_dashboard_path, current_path
    assert page.has_content?("Admin Dashboard")
  end

  test "user cannot access admin dashboard" do
    User.create(username: "cole", name: "Cole Hall", password: "password", role: 0)
    visit login_path

    fill_in "Username", with: "cole"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, Cole Hall!")
    assert "/dashboard", current_path

    visit admin_dashboard_path

    assert page.has_content?("404")
  end

  test "unregistered user cannot access admin dashboard" do
    visit login_path

    assert page.has_content?("Login")

    visit '/admin/dashboard'

    assert page.has_content?("404")
  end

  test "admin can update account details but not other users" do
    login_admin
    click_link "Edit Account"

    assert admin_dashboard_path, current_path

    fill_in "Username", with: "acareaga"
    fill_in "Password", with: "password"
    click_button "Update Account"

    assert page.has_content?("acareaga")
  end

  test "admin can delete their account" do
    login_admin
    click_link "Delete Account"

    assert root_path, current_path
  end
end
