require 'test_helper'

class VisitorCanFilterThroughTicketCategoryTest < ActionDispatch::IntegrationTest

  test "visitor can utilize category dropdown search" do
    visit root_path
    save_and_open_page
  end
end
