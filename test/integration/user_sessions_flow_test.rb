require 'test_helper'

class UserSessionsFlowTest < ActionDispatch::IntegrationTest

  test "user redirected to login path when givin invalid credentials" do
    user = create_user
    visit root_path
    incorrect_password = "ilovedixtix"

    click_link "Login"
    fill_in "Username", with: "cole"
    fill_in "Password", with: incorrect_password
    click_button "Login"

    assert page.has_content?("Invalid login credentials")
    assert login_path, current_path
  end
    
  test "logged in user can log out" do
    create_and_login_user

    click_on "Logout"
    assert root_path, current_path
  end

  test "user can not access priveleged areas of app" do
    user = create_and_login_user
    visit 'my-string/dashboard'

    assert page.has_content?("you are not authorized to view this content.")
    assert root_path, current_path
  end

end
