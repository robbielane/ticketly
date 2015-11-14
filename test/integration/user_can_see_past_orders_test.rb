class UserCanSeePastOrdersTest < ActionDispatch::IntegrationTest
  test "user can see past orders" do
    create_and_login_user
    user = User.first

    order1 = user.orders.create(total: 1001,
                                created_at: Time.new(2011, 11, 10, 15, 25, 0))
    order2 = user.orders.create(total: 200,
                                created_at: Time.new(2012, 11, 12, 15, 25, 0))

    order1.pursuits.create(name: "Hiking",
                           description: "Hike the Alps",
                           price: 1001)

    order2.pursuits.create(name: "Jet Skiing",
                           description: "Jet Skiing in Jamaica",
                           price: 200)

    visit orders_path

    assert page.has_content?("Order History")

    within(".cart-table") do # within() vs. within_table() ?!
      assert page.has_content?("Trips Ordered")
      assert page.has_content?("Total Price")
      assert page.has_content?("Date Ordered")

      # assert find('tr', text: "Trips Ordered").has_content?("Hiking")
      assert page.has_content?("Hiking (Travellers: 1)")
      assert page.has_content?("$1,001")
      assert page.has_content?("November 10, 2011")

      assert page.has_content?("Jet Skiing (Travellers: 1)")
      assert page.has_content?("$200")
      assert page.has_content?("November 12, 2012")
    end
  end

  test "user can place an order and is redirected to the order history page" do
    # create_and_login_user
    checkout_user(2)
    user = User.first

    assert page.has_content?("Order History")

    within(".cart-table") do # within() vs. within_table() ?!
      assert page.has_content?("Trips Ordered")
      assert page.has_content?("Total Price")
      assert page.has_content?("Date Ordered")

      # assert find('tr', text: "Trips Ordered").has_content?("Hiking")
      assert page.has_content?("Hiking the Alps 1 (Travellers: 1)")
      assert page.has_content?("Hiking the Alps 1 (Travellers: 2)")
      assert page.has_content?("$3,003")
      assert page.has_content?("#{Order.first.created_at.strftime("%B %d, %Y")}")
    end
  end

  test "authenticated user can see individual past orders" do
    # Background: An existing user that has one previous order
    skip
    checkout_user(1)
    #   As an authenticated user
    #   When I visit "/orders"
    visit_path orders_path

    click_link "View order details"
    # assert_equal  , current_path

    #   Then I should see each item that was order with the quantity and line-item subtotals
    #   And I should see links to each item's show page
    #   And I should see the current status of the order (ordered, paid, cancelled, completed)
    #   And I should see the total price for the order
    #   And I should see the date/time that the order was submitted
    #   If the order was completed or cancelled
    #   Then I should see a timestamp when the action took place
    #   And if any of the items in the order were retired from the menu
    #   Then they should still be able to access the item page
    #   But they should not be able to add the item to their cart
  end
end
