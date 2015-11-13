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
    create_and_login_user
    user = User.first
    add_items_to_cart(2)
    visit "/cart"
    click_button "Checkout"
    #   num.times do |i|
    #     i += 1
    #     create_pursuits(1, "Hiking #{i}")
    #     pursuit = Activity.find_by_name("Hiking #{i}").pursuits.first    #
    #     fill_in "travellers", with: i
    #   end

    visit orders_path

    assert page.has_content?("Order History")

    within(".cart-table") do # within() vs. within_table() ?!
      assert page.has_content?("Trips Ordered")
      assert page.has_content?("Total Price")
      assert page.has_content?("Date Ordered")

      # assert find('tr', text: "Trips Ordered").has_content?("Hiking")
      assert page.has_content?("Hiking 1 (Travellers: 1)")
      assert page.has_content?("Hiking 2 (Travellers: 2)")
      assert page.has_content?("$2,003")
      assert page.has_content?("#{Time.now.strftime("%B %d, %Y")}")
    end
  end
end
