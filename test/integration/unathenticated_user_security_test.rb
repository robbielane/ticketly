require "test_helper"

class UnathenticatedUserSecurityTest < ActionDispatch::IntegrationTest
  test "unathenticated user cannot see another users dashboard" do
    visit login_path

    fill_in "Username", with: "Nicole"
    fill_in "Password", with: "pass"
    click_button "Login"

    assert_equal login_path, current_path
    assert page.has_content?("Login")
  end

  test "unathenticated user cannot see another users orders" do
    checkout_user(1)
    click_link "Logout"

    User.create(name: "Torie", username: "tjw", password: "password")
    visit login_path
    fill_in "Username", with: "tjw"
    fill_in "Password", with: "password"
    click_button "Login"

    other_users_order_id = Order.first.id

    visit order_path(other_users_order_id)
    assert page.has_content?("The page you were looking for doesn't exist")
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
