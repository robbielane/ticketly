require 'test_helper'

class AdminCanViewPursuitsTest < ActionDispatch::IntegrationTest

  test "Admin can view all items" do
    create_pursuits(2, "Hiking")
    User.create(username: "acareaga", password: "pass", name: "Aaron", role: 1)

    visit root_path

    fill_in "Username", with: "acareaga"
    fill_in "Password", with: "pass"
    click_button "Login"

    assert admin_dashboard_path, current_path

    click_link ("View All Pursuits")

    assert "/admin/pursuits", current_path

    assert page.has_content?("Pursuits")
    assert page.has_content?("Hiking")
    assert page.has_content?("Go hike the alps")
    assert page.has_content?("ACTIVE")
    assert page.has_button?("Edit")
  end
end
