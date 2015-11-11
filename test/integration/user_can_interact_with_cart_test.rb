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
    assert_equal pursuits_path, current_path
    assert page.has_content?("You have added Hiking the Alps 1 to your cart.")
  end

  test "user can view cart" do
    visit pursuits_path
    add_items_to_cart(2)
    click_link "View Cart"

    assert_equal "/cart", current_path

    assert page.has_content?("Hiking the Alps 1")
    assert page.has_content?("Go hike the alps! 1")
    assert page.has_content?("$1,001")

    assert page.has_content?("Total: $2,002") # And I should see a small image
  end

  test "user can delete item from cart" do
    add_items_to_cart(1)
    removed_pursuit = Pursuit.find_by_name("Hiking the Alps 1")
    visit "/cart"
    first(".trip").click_link("Remove")

    assert_equal "/cart", current_path

    message = page.find(:css, "flash_notices")
    message_color = message.native.style("background-color")

    assert_equal "rgba(0, 10, 0, 1)", message_color # I should see a message styled in green
    assert page.has_content?("Successfully removed Hiking the Alps 1 from your cart.")

    within(".cart") do
      refute page.has_content?("Hiking the Alps 1")
    end

    click_link("Hiking the Alps 1")
    assert_equal pursuit_path(removed_pursuit), current_path
  end

  test "user can edit the number of travellers in cart" do
    visit pursuits_path
    add_items_to_cart(1)
    click_link "View Cart"

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

  def add_items_to_cart(num)
    num.times do |i|
      i += 1
      create_pursuits(1, "Hiking #{i}")
      pursuit = Activity.find_by_name("Hiking #{i}").pursuits.first

      visit pursuit_path(pursuit)
      click_link "Purchase Trip"

      fill_in "Travellers", with: i
      click_button "Place Order"
    end
  end
end
