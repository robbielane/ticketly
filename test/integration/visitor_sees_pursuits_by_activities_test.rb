require "test_helper"

class VisitorSeesPursuitsByActivitiesTest < ActionDispatch::IntegrationTest
  test "visitor can see list of activities" do
    create_pursuits(2, "Hiking")
    create_pursuits(2, "Fishing")

    visit pursuits_path

    assert page.has_content?("Hiking")
    assert page.has_content?("Fishing")
  end

  test "visitor can see pursuits sorted by activities" do
    create_pursuits(2, "Hiking")
    create_pursuits(2, "Fishing")

    visit pursuits_path
    click_link "Hiking"

    assert_equal '/hiking', current_path

    within("h1") do
      assert page.has_content?("Hiking")
    end

    within("#hiking_the_alps_1") do
      assert page.has_content?("Hiking the Alps 1")
      assert page.has_content?("Go hike the alps! 1")
      assert page.has_content?("$1,001")
    end
  end
end
