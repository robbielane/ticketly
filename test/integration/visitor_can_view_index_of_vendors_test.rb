require 'test_helper'

class VisitorCanViewIndexOfVendorsTest < ActionDispatch::IntegrationTest

  test 'root has link to view vendor index' do
    visit root_path

    click_link 'Vendors'
    assert_equal vendors_path, current_path

    assert page.has_content?("Jhun's Swag")
    assert page.has_content?("active")
  end

  test 'vendor index has link to vendor tickets and details' do
    visit vendors_path

    click_link "Jhun's Swag"

    assert page.has_content?("Ticket ID")
    assert page.has_content?("Section")
    assert page.has_content?("Row")
    assert page.has_content?("Price")
    assert page.has_content?("Seat")
  end

  test 'vendor show lists available tickets' do
    skip
    visit vendor_path()

    within "##{disney.id}" do
      assert page.has_content?("110")
      assert page.has_content?("23")
      assert page.has_content?("4")
      assert page.has_content?("$70")
    end
  end
end
