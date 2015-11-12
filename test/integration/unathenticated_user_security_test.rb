require 'test_helper'

class UnathenticatedUserSecurityTest < ActionDispatch::IntegrationTest

  test "unathenticated user cannot see another users dashboard or orders" do
    visit "/"

    click_button "Login"

    fill_in "Username:", with: "Nicole"
    fill_in "Password", with: "pass"
    click_button "Login"

    assert_equal login_path, current_path
    assert page.has_content?("Login")
  end

  test "unathenticated user cannot make themself an admin account" do
    visit "/"

    click_button "Follow Your Pursuit"

    assert_equal new_user_path, current_path
    refute page.has_content?("role")

    fill_in "Username", with: "Nicole"
    fill_in "Password", with: "pass"
    fill_in "Name", with: "Cole Hall"
    fill_in "Interests", with: "Jetskiing"

    click_button ("Create Account")
    click_button("Login")

    fill_in "Username", with: "Nicole"
    fill_in "Password", with: "pass"

    assert page.has_content("You are loggin in as Nicole")
    refute page.has_content("Create Pursuit")
    refute page.has_content("Create User")
  end
end
