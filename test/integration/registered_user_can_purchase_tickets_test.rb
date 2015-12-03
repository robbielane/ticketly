require 'test_helper'

class RegisteredUserCanPurchaseTicketsTest < ActionDispatch::IntegrationTest

  test "registered user can add to cart" do
    ticket = tickets(:one)
    create_and_login_user
    visit root_path
    click_link "Events"
    click_link "Disney Frozen On Ice"
    within("##{ticket.id}") do
      click_on "Purchase"
    end
    click_on "Cart"
    assert cart_path, current_path 
    click_on "Checkout"
    assert page.has_content?("Order was successfully placed")
  end

end
