require "test_helper"

class UserCanInteractWithCartTest < ActionDispatch::IntegrationTest
  test "user can add item to cart" do
    create_pursuits(1, "Hiking")
    pursuit = Activity.find_by_name("Hiking").pursuits.first
    visit pursuit_path(pursuit)

    assert page.has_content?("Trips: 0")

    click_link "Purchase Trip"

    assert_equal new_cart_pursuit_path, current_path

    fill_in "travellers", with: 2
    click_button "Place Order"

    assert page.has_content?("Trips: 1")
    assert_equal pursuits_path, current_path
    assert page.has_content?("You have added Hiking the Alps 1 to your cart.")
  end

  test "user can view cart" do
    visit pursuits_path
    add_items_to_cart(2)
    click_link "Trips: 2"

    assert_equal "/cart", current_path

    assert page.has_content?("Hiking the Alps 1")
    assert page.has_content?("Go hike the alps! 1")
    assert page.has_content?("$1,001")

    assert page.has_content?("Total: $3,003")
  end

  test "user can delete item from cart" do
    add_items_to_cart(1)
    removed_pursuit = Pursuit.find_by_name("Hiking the Alps 1")
    visit "/cart"

    within(".pursuit_card") do
      click_button("Remove")
    end

    assert_equal "/cart", current_path
    assert page.has_content?("You have removed the trip Hiking the Alps 1 from your cart.")

    within(".cart") do
      refute page.has_content?("Hiking the Alps 1")
    end

    click_link("Hiking the Alps 1")
    assert_equal pursuit_path(removed_pursuit), current_path
  end

  test "user can edit the number of travellers in cart" do
    visit pursuits_path
    add_items_to_cart(1)
    click_link "Trips: 1"

    assert_equal "/cart", current_path
    assert page.has_content?("Hiking the Alps 1")
    assert page.has_content?("$1,001")

    assert_equal "/cart", current_path
    fill_in "travellers", with: 5
    click_button "Update"

    assert_equal "/cart", current_path
    assert page.has_content?("$5,005")

    assert_equal "/cart", current_path
    fill_in "travellers", with: 2
    click_button "Update"

    assert_equal "/cart", current_path
    assert page.has_content?("$2,002")
  end

  test "user can view items in cart after they log back in" do
    add_items_to_cart(2)

    User.create(name: "Nicole", username: "cole", password: "password")

    visit pursuits_path
    click_link "Login"
    fill_in "Username", with: "cole"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Trips: 2")
    click_link "Logout"
    assert page.has_content?("Login")
    refute page.has_content?("Logout")
  end
end
