require "test_helper"

class UserCanCheckoutTest < ActionDispatch::IntegrationTest
  test "user must be logged in to checkout" do
    add_items_to_cart(1)
    visit "/cart"
    click_button "Checkout"

    assert page.has_content?("You must be logged in to checkout")
    assert_equal login_path, current_path
  end

  test "logged in user can checkout" do
    checkout_user(1)

    assert_equal "/orders", current_path
    assert page.has_content?("Order was successfully placed")

    within(".cart-table") do
      assert page.has_content?("Hiking the Alps 1 (Travellers: 1)")
    end
  end

  test "cart resets to empty when user checks out" do
    checkout_user(1)
    visit pursuits_path

    assert page.has_content?("Trips: 0")
    refute page.has_content?("Trips: 1")
  end
end
