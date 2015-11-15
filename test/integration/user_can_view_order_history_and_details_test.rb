require 'test_helper'

class UserCanViewOrderHistoryAndDetailsTest < ActionDispatch::IntegrationTest

  test "existing user can view past order details" do
    visit "/orders"

    assert page.has_content?("Hiking in the Alps 1")
    assert page.has_content?("Order Details")

    click_link "Order Details"

    assert_equal "/orders/11_11_15", current_path
    assert page.has_content?("Hiking in the Alps 1") #title should link to item show
    assert page.has_content?("Travellers: 1")
    assert page.has_content?("Total: $1,001")
    assert page.has_content?("Status: Completed")
    assert page.has_content? ("Ordered: 11/11/15 at 8:47 PM")
    assert page.has_content? ("Fulfilled: 11/12/15 at 7:20 AM")

    # And if any of the items in the order were retired from the menu
    # Then they should still be able to access the item page
    # But they should not be able to add the item to their cart
  end
end
