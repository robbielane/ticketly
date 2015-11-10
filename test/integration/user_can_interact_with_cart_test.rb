require "test_helper"

class UserCanInteractWithCartTest < ActionDispatch::IntegrationTest
  test "user can add item to cart" do
    create_pursuits(1, "Hiking")
    pursuit = Activity.find_by_name("Hiking").pursuits.first
    visit pursuit_path(pursuit)

    assert page.has_content?("Trips: 0")

    click_link "Purchase Trip"

    assert_equal new_cart_pursuit_path, current_path

    fill_in "Travellers", with: 2
    click_button "Place Order"

    assert page.has_content?("Trips: 1")
    assert_equal cart_path, current_path
    assert page.has_content?("Hiking in the Alps 1")
    assert page.has_content?("Travellers: 2")
  end

  test "user can view cart" do
    skip

#     As a visitor
# When I visit any page with an item on it
# I should see a link or button for "Add to Cart"
# When I click "Add to cart" for that item
# And I click a link or button to view cart
# And my current path should be "/cart"
# And I should see a small image, title, description and price for the item I just added
# And there should be a "total" price for the cart that should be the sum of all items in the cart

    assert_equal "/cart", current_path
  end
end
