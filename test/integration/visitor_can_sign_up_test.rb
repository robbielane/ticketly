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
    assert page.has_content?("Account Created!")
    assert_equal user_count + 1, User.count
  end

  test "visitor fails to submit necessary info when joining" do
    visit root_path
    click_on "Join"
    fill_in "Name", with: "Donald Trump"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert dashboard_path, current_path
    assert page.has_content?("Invalid user credentials. Please try again.")
  end

  test "visitor can sign up as vendor" do
    visit root_path
    click_on "Join"
    fill_in "Name", with: "Donald Trump"
    fill_in "Username", with: "Trumpster"
    fill_in "Password", with: "password"
    fill_in "Email", with: "don@thetrumpnation.com"
    check("Vendor")
    click_button "Create Account"

    greeting = "Donald trump Dashboard"
    assert page.has_content?(greeting)
    assert page.has_content?("Account Created!")
  end
end
