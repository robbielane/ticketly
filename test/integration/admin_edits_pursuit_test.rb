require 'test_helper'

class AdminEditsPursuitTest < ActionDispatch::IntegrationTest

  test "admin can edit an existing pursuit" do
    create_pursuits(1, "Hiking")
    User.create(username: "acareaga", password: "pass", name: "Aaron", role: 1)

    visit root_path

    fill_in "Username", with: "acareaga"
    fill_in "Password", with: "pass"
    click_button "Login"

    assert admin_dashboard_path, current_path

    click_link ("View All Pursuits")

    assert "/admin/pursuits", current_path
    assert page.has_content?("Hiking")

    click_button "Edit"

    assert "/admin/pursuits/#{pursuit}/edit", current_path

    fill_in "Name", with: "Skiing"
    fill_in "Price", with: "650"
    fill_in "Status", with: "Active"

    click_button "Update Pursuit"

    assert admin_dashboard_path, current_path
  end
end
