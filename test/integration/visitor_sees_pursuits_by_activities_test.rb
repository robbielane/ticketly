require "test_helper"

class VisitorSeesPursuitsByActivitiesTest < ActionDispatch::IntegrationTest
  test "visitor can see list of activities" do
    create_pursuits(2)
    create_pursuits(2)

    visit pursuits_path

    assert page.has_content?("Hiking 1")
    assert page.has_content?("Hiking 2")
  end

  test "visitor can see pursuits sorted by activities" do
    create_pursuits(2)
    create_pursuits(2)

    visit pursuits_path
    click_link "Hiking 1"

    assert_equal '/hiking_1', current_path


  end

# Background: I have two categories with titles and each has two different items assigned
# As a visitor
# When I visit "/CATEGORY_NAME"
# I see all items assigned to that category

end
