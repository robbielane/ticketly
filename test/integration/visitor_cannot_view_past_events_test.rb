require 'test_helper'

class VisitorCannotViewPastEventsTest < ActionDispatch::IntegrationTest
  test 'past events not shown on events index' do
    visit events_path

    assert page.has_content?("Disney Frozen On Ice")
    assert page.has_content?("Justin Bieber")
    refute page.has_content?("Star Wars")
  end
end
