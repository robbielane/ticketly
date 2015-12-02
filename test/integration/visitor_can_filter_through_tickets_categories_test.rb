require 'test_helper'

class VisitorCanFilterThroughTicketCategoryTest < ActionDispatch::IntegrationTest

  test "visitor can utilize category dropdown search" do
    visit root_path
  end
end
