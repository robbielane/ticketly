require 'test_helper'

class VisitorCanViewIndexOfEventsTest < ActionDispatch::IntegrationTest
  def disney
    Event.last
  end

  test 'it has link on root to view event index' do
    visit root_path

    click_link 'Buy Tickets'
    assert_equal events_path, current_path

    assert page.has_content?("Disney Frozen On Ice")
    assert page.has_content?("Justin Bieber")
  end

  test 'event index has link to event' do
    visit events_path

    click_link disney.name

    assert page.has_content?("Disney Frozen On Ice")
    assert page.has_content?("Pepsi Center")
    assert page.has_content?("Denver, CO")
  end

  test 'event page lists available tickets' do
    visit event_path(disney)
    
    within "##{disney.id}" do
      assert page.has_content?("110")
      assert page.has_content?("23")
      assert page.has_content?("4")
      assert page.has_content?("$70")
    end
  end

end
