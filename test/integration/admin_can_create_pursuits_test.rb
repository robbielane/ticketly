require "test_helper"

class AdminCanCreatePursuitsTest < ActionDispatch::IntegrationTest
  test "admin can create pursuit" do
    login_admin

    click_link("Add Pursuit")

    assert_equal new_admin_pursuit_path, current_path
    assert page.has_content?("Add a New Pursuit")

    fill_in "Name", with: "Hiking in the Alps"
    fill_in "Description", with: "Have a ball hiking in the alps!"
    fill_in "Price", with: "1000"
    fill_in "Activity", with: "Hiking"
    click_button "Create Pursuit"

    assert_equal pursuit_path(Pursuit.first), current_path
    assert page.has_content?("The pursuit 'Hiking in the Alps' has been created")

    visit pursuits_path
    assert page.has_content?("Hiking in the Alps")
  end

  test "admin can upload photo for pursuit" do
    skip
  end

  test "user cannot access new pursuit path" do
    create_and_login_user
    visit new_pursuit_path

    assert page.has_content?("The page you were looking for doesn't exist")
    refute page.has_content?("Add a New Pursuit")
  end
end
