require 'test_helper'

class AdminEditsPursuitTest < ActionDispatch::IntegrationTest
  test "admin can edit an existing pursuit" do
    create_pursuits(1, "Hiking")
    login_admin

    click_link ("View All Pursuits")

    assert admin_pursuits_path, current_path
    assert page.has_content?("Hiking")

    click_button "Edit"

    assert "/admin/pursuits/#{Pursuit.first.id}/edit", current_path

    fill_in "Name", with: "Skiing"
    fill_in "Price", with: "650"
    fill_in "Status", with: "Active"

    click_button "Update Pursuit"

    assert admin_dashboard_path, current_path
  end
end
