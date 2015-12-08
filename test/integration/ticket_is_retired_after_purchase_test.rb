require 'test_helper'

class TicketIsRetiredAfterPurchaseTest < ActionDispatch::IntegrationTest
  test 'ticket is not shown in index after purchase' do
    event = events(:one)
    ticket = tickets(:one)
    create_and_login_user
    visit event_path(event)
    within "##{ticket.id}" do
      click_button "Purchase"
    end
    click_link "Cart: 1"
    click_link "Checkout"
    visit event_path(event)

    refute page.has_css?("##{ticket.id}")
  end

  test 'message is shown when no tickets available for event' do
    event = events(:one)
    ticket = tickets(:one)
    ticket2 = tickets(:two)
    create_and_login_user
    visit event_path(event)
    within "##{ticket.id}" do
      click_button "Purchase"
    end
    within "##{ticket2.id}" do
      click_button "Purchase"
    end
    click_link "Cart: 2"
    click_link "Checkout"
    visit event_path(event)

    assert page.has_content?("No Tickets Available at this time.")
  end
end
