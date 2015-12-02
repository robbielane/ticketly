require 'test_helper'

class VisitorCanViewIndexOfEvents < ActionDispatch::IntegrationTest
  test 'it has link on root to view event index' do
    visit root_path

    click_link 'View Events'
    assert_equal vendor_path, current_path

    assert page.has_content("Disney Frozen On Ice - Pepsi Center - Denver")
    assert page.has_content("Justin Bieber - Pepsi Center - Denver")
  end

end
