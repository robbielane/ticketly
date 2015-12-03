require 'test_helper'

class RegisteredUserCanPurchaseTicketsTest < ActionDispatch::IntegrationTest

  test "Registered user can add to cart" do
    create_and_login_user
    visit root_path
    click_link "Events"
    click_link "Justin Bieber"
    click_link "Purchase"
    save_and_open_page
    click_button "Buy Tickets"


  end

end
