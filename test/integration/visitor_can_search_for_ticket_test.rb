require 'test_helper'

class VisitorCanSearchForTicketTest < ActionDispatch::IntegrationTest

  test "Guest can visit the homepage" do
    visit root_path

    assert page.has_content?("Ticketly")
    assert page.has_content?("Buy Tickets")
    assert page.has_content?("Sell Tickets")
  end

  test "Guest can see index of events" do
    visit root_path

    within("#concerts") do
      click_link "View Events"
    end

    assert events_path, current_path

    assert page.has_content?("Event Name")
    assert page.has_content?("Category")
    assert page.has_content?("Venue")
    assert page.has_content?("Location")
    assert page.has_content?("Tickets Available")
  end

  test "Guest can search for tickets based on event name" do
    visit events_path

    within("#search-field") do
      fill_in "query", with: "Disney" + "\n"
    end

    click_button "Search"
    Event.reindex

    assert page.has_content?("Disney")
    refute page.has_content?("Justin")
  end
end
