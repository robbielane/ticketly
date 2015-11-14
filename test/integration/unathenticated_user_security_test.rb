require "test_helper"

class UnathenticatedUserSecurityTest < ActionDispatch::IntegrationTest
  test "unathenticated user cannot see another users dashboard or orders" do
    visit root_path

    click_button "Login"

    fill_in "Username", with: "Nicole"
    fill_in "Password", with: "pass"
    click_button "Login"

    assert_equal login_path, current_path
    assert page.has_content?("Login")
  end

  test "unathenticated user cannot make themself an admin account" do
    visit root_path

    click_button "Apply for Membership"

    assert_equal new_user_path, current_path
    refute page.has_content?("role")

    fill_in "Username", with: "Nicole"
    fill_in "Password", with: "pass"
    fill_in "Name", with: "Cole"

    click_button ("Create Account")

    assert page.has_content?("Welcome, Cole!")
    refute page.has_content?("Admin Dashboard")
    refute page.has_content?("Create Pursuit")
    refute page.has_content?("Create User")
  end

  test "unathenticated user is redirected to login page when they try checkout" do
    add_items_to_cart(2)
    visit "/cart"
    click_button "Checkout"

    assert_equal login_path, current_path
    assert page.has_content?("Login to Your Account")
  end
end
