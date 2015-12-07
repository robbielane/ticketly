require 'test_helper'

class VisitorCanSignUpTest < ActionDispatch::IntegrationTest
  test "visitor signs up" do
    user_count = User.count
    assert_equal 2, user_count

    visit root_path
    click_on "Join"
    fill_in "Name", with: "Donald Trump"
    fill_in "Username", with: "Trumpster"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert dashboard_path, current_path
    assert page.has_content?("Welcome, Donald trump!")
    assert_equal user_count + 1, User.count
  end
end
