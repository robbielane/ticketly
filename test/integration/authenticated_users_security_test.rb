require 'test_helper'

class AuthenticatedUsersSecurityTest < ActionDispatch::IntegrationTest

  test "authenticated user cannot access another users dashboard" do
    User.create(name: "Nicole", username: "cole", password: "password")
    User.create(name: "Torie", username: "torie", password: "pass")

    visit root_path
    click_link "Login"
    fill_in "Username", with: "cole"
    fill_in "Password", with: "pass"
    click_button "Login"

    assert_equal "/login", current_path
  end

  test "authenticated user cannot access an admin dashboard or create trips" do
    user = User.create(name: "Nicole", username: "cole", password: "password", role: 0)
    admin = User.create(name: "Aaron", username: "AaronC", password: "password", role: 1)
    visit admin_login_path
    refute 
  end

  test "authenticated user cannot make themself an admin" do
    skip
  end
end
