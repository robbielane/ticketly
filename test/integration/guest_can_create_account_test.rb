require 'test_helper'

class GuestCanCreateAccountTest < ActionDispatch::IntegrationTest

  test "guest can view the homepage" do
    visit '/'

    assert page.has_content?("Global Pursuits")
    assert page.has_button?("Pursue Your Passion")
  end

  test "account can be created" do
    visit root_path
    assert page.has_content?("Global Pursuits")
    assert page.has_button?("Create Account")
    click_link "Create Account"
    assert_equal new_user_path ,current_path

  end

  test "a user can be created" do
    visit new_user_path
    fill_in "Username", with: "Nicole"
    fill_in "Password", with: "password"

    click_button "Create Account"

    assert page.has_content?("Welcome, Nicole")
  end

  test "a registered user can log in" do
    user = User.create(username: "Nicole", password: "password")

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"

    click_button "Login"

    assert page.has_content?("Welcome, Nicole")
  end
end
