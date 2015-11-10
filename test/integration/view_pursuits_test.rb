require "test_helper"

class ViewPursuitsTest < ActionDispatch::IntegrationTest
  test "visitor can see pursuits" do
    create_pursuits(2, "Hiking")
    visit pursuits_path

    assert_equal pursuits_path, current_path

    within("h1") do
      assert page.has_content?("Pursuit")
    end

    within("#hiking_the_alps_1") do
      assert page.has_content?("Hiking the Alps 1")
      assert page.has_content?("Go hike the alps! 1")
      assert page.has_content?("$1,001")
    end

    within("#hiking_the_alps_2") do
      assert page.has_content?("Hiking the Alps 2")
      assert page.has_content?("Go hike the alps! 2")
      assert page.has_content?("$1,002")
    end
  end

  test "visitor can view pursuit details" do
    create_pursuits(1, "Hiking")
    pursuit = Activity.find_by_name("Hiking").pursuits.first
    visit "/hiking"
    click_link "Details"

    assert_equal pursuit_path(pursuit), current_path

    within("h1") do
      assert page.has_content?("Hiking the Alps 1")
    end

    within("p.pursuit-description") do
      assert page.has_content?("Go hike the alps! 1")
    end

    within("h2") do
      assert page.has_content?("$1,001")
    end

  end
end
