class UserCanSeePastOrdersTest < ActionDispatch::IntegrationTest
  test "user can see past orders in" do
    skip
    create_user

    pursuit1 = Pursuit.create(name: "Hiking", description: "Hike the Alps", price: 1001)
    pursuit2 = Pursuit.create(name: "Jet Skiing", description: "Jet Skiing in Jamaica", price: 100)

    order1 = Order.create(pursuit1)
    order2 = Order.create(pursuit2)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit orders_path # orders index route

    assert page.has_content?("Hiking, price: $1001, purchase_date: 2014-11-11")
    #I have the purchase date here b/c when the order goes into the AR table
    #it will have a time stamp on it. Purchase date seems like a thing that would
    #be a part of an individual order's
    assert page.has_content?("Jet Skiing, price: $100, purchase_date: 2015-11-11")

  end
end
