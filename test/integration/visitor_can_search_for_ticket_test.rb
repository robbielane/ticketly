require 'test_helper'

class VisitorCanSearchForTicketTest < ActionDispatch::IntegrationTest

  test "Guest can visit the homepage" do
    visit root_path

    assert page.has_content?("Ticketly")
    assert page.has_content?("Buy Tickets")
    assert page.has_content?("Sell Tickets")
  end

  test "Guest can search for tickets based on event type" do
    visit root_path

    # within "#search-bar" do
    #   fill-in "Pokemon"
    # end

    assert "/catching-pokemon", current_path
    assert page.has_content?("Pikachu")
  end
end
