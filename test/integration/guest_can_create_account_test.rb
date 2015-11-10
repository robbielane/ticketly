require 'test_helper'

class GuestCanCreateAccountTest < ActionDispatch::IntegrationTest

  test "guest can view the homepage" do
    visit '/'

    assert page.has_content?("Global Pursuits")
    assert page.has_button?("Pursue Your Passion")
  end
end
