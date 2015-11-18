require "test_helper"

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
    user = create_user
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
    create_and_login_user

    click_link "Logout"
    assert page.has_content?("Login")
    refute page.has_content?("Logout")
  end

  test "user can edit account details and password" do
    create_and_login_user

    assert page.has_content?("Welcome, ")
    click_link "Edit Account"

    fill_in "Username", with: "aaron"
    fill_in "Password", with: "pass"

    click_button "Update Account"

    assert dashboard_path, current_path
    assert page.has_content?("aaron")
  end

  test "user can delete their account" do
    create_and_login_user

    assert page.has_content?("Welcome, Nicole")
    click_link "Delete Account"

    assert root_path, current_path
    assert page.has_content?("Pursue Your Passion")
  end

  test "user cannot see login forms if they are already logged in" do
    create_and_login_user

    visit root_path

    refute page.has_content?("Login to Your Account")

    visit login_path

    refute page.has_content?("Login to Your Account")
    assert page.has_content?("You are already logged in as Nicole.")
  end

  test "user cannot create an account if already logged in" do
    create_and_login_user

    visit new_user_path

    refute page.has_content?("Create Account")
    assert page.has_content?("You are already logged in as Nicole.")
  end
end
