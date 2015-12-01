require 'test_helper'

class TestVistorIsPromptedToLogInTest < ActionDispatch::IntegrationTest
  test "that a guest is prompted to log in when they are attempthing to purchase" do
    ticket = Ticket.create!(name:"Pokemon League", price:20, section:"A", row:"B",seat:"D")

    visit "/tickets"

    click_link "Buy Tickets"

    assert login_path, current_path
  end



#   As a guest visitor,
# I can add tickets to my cart,
# but when I attempt to checkout,
# I am prompted to sign in or sign up,
# and when I sign in, I can resume shopping.
end
