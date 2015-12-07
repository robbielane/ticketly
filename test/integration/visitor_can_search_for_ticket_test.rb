


require 'test_helper'

class VisitorCanSearchForTicketTest < ActionDispatch::IntegrationTest

  test "Guest can visit the homepage" do
    visit root_path

    assert page.has_content?("Ticketly")
    assert page.has_content?("Buy Tickets")
    assert page.has_content?("Sell Tickets")
  end

  test "Guest can see index of events" do
    skip
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

  test "visitor is routed to login page when trying to checkout" do
    ticket = tickets(:one)

    visit root_path
    click_link "Events"
    click_link "Disney Frozen On Ice"
    within("##{ticket.id}") do
      click_on "Purchase"
    end
    click_on "Cart"
    assert cart_path, current_path
    click_on "Checkout"

    flash = "You must be logged in to checkout"
    assert page.has_content?(flash)
    assert login_path, current_path
  end


  test "visitor can join ticketly and upload a profile picture" do
    visit root_path

    click_link "Join"

    fill_in "Name", with: "Jhun"
    fill_in "Username", with: "yung-jhun"
    fill_in "Password", with: "pass"

    assert page.has_content?("Upload Image")

    click_link "Create Account"

    assert_equal user_dashboard_path, current_path
    assert page.has_content?("Logged in as Jhun")
  end
end
