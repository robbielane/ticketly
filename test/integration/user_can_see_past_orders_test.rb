class UserCanSeePastOrdersTest < ActionDispatch::IntegrationTest
  test "user can see past orders in" do
    order1 = Order.create
    order2 = Order.create

    order1.pursuits.create(name: "Hiking",
                           description: "Hike the Alps",
                           price: 1001)

    order2.pursuits.create(name: "Jet Skiing",
                           description: "Jet Skiing in Jamaica",
                           price: 100)

    create_and_login_user
    visit orders_path

    binding.pry
    assert page.has_content?("Order History")
    
    within(".table") do
      assert page.has_content?("Hiking, price: $1001, purchase_date: 2015-11-11")
      assert page.has_content?("Jet Skiing, price: $100, purchase_date: 2015-11-11")
    end
  end
end
