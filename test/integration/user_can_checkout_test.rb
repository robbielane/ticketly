require "test_helper"

class UserCanCheckoutTest < ActionDispatch::IntegrationTest
  def setup
    add_items_to_cart(1)
  end

  def create_and_login_user
    user = User.create(username: "poodle", name: "Arrow", password: "woof")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "woof"
    click_button "Login"
  end

  test "user must be logged in to checkout" do
    visit "/cart"
    click_button "Checkout"

    assert page.has_content?("You must be logged in to checkout")
    assert_equal login_path, current_path
  end

  test "logged in user can checkout" do
    create_and_login_user
    add_items_to_cart(1)
    visit "/cart"
    click_button "Checkout"

    assert_equal "/orders", current_path
    assert page.has_content?("Order was successfully placed")

    within(".table") do
      assert page.has_content?("Hiking 1 for 1 traveller")
    end
  end
end
