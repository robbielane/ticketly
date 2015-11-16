require "test_helper"

class AdminCanCreatePursuitsTest < ActionDispatch::IntegrationTest
  test "admin can create pursuit" do
    login_admin

    click_link("Add Pursuit")

    assert_equal new_pursuit_path, current_path
    assert page.has_content?("Add a New Pursuit")

    fill_in "Name", with: "Hiking in the Alps"
    fill_in "Description", with: "Have a ball hiking in the alps!"
    fill_in "Price", with: "1000"
    click_button "Create Pursuit"

    assert page.has_content?("The pursuit 'Hiking in the Alps' has been created")

    visit pursuits_path
    assert page.has_content?("Hiking in the Alps")
  end

  test "user cannot access new pursuit path" do
    skip
  end
end
