require 'test_helper'

class UserRedirectedProperlyWhenProvidingIncorrectCredentialsTest < ActionDispatch::IntegrationTest

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
    
end
