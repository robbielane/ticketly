require 'test_helper'

class GuestCanCreateAccountTest < ActionDispatch::IntegrationTest

  test "guest can view the homepage" do
    visit '/'

    assert page.has_content?("Global Pursuit")
    assert page.has_button?("Apply for Membership")
  end

  test "account can be created" do
    visit root_path
    assert page.has_content?("Global Pursuit")
    click_button "Apply for Membership"
    assert_equal new_user_path, current_path

    fill_in "Username", with: "Nicole@gmail.com"
    fill_in "Name", with: "Nicole"
    fill_in "Password", with: "password"

    click_button "Create Account"

    assert_equal "/dashboard", current_path
    assert page.has_content?("Logged in as Nicole")
    assert page.has_content?("Username: Nicole@gmail.com")
    assert page.has_content?("Name: Nicole")

    refute page.has_content?("Login")
    assert page.has_content?("Logout")
  end

  test "a registered user can login" do
    user = User.create(username: "cole", name: "Nicole", password: "password")

    visit root_path
    click_link "Login"

    assert_equal login_path, current_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"

    click_button "Login"

    assert_equal "/dashboard", current_path
    assert page.has_content?("Logged in as Nicole")
  end

  test "a registered user can logout" do
    User.create(name: "Nicole", username: "cole", password: "password")

    visit pursuits_path
    click_link "Login"
    fill_in "Username", with: "cole"
    fill_in "Password", with: "password"
    click_button "Login"

    click_link "Logout"
    assert page.has_content?("Login")
    refute page.has_content?("Logout")
  end
end
