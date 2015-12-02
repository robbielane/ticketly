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

    click_link "Buy Tickets"

    assert tickets_path, current_path
  end
end
