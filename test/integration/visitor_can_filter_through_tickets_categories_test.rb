require 'test_helper'

class VisitorCanFilterThroughTicketCategoryTest < ActionDispatch::IntegrationTest

  test "visitor can utilize category dropdown search" do
    category = categories(:kids)

    visit root_path
    click_link "Categories"
    click_link "Kids"
    assert page.has_content?("Current Events for Kids")
    assert page.has_content?("Disney Frozen On Ice")
    assert_equal current_path, category_path(category)
  end
end
