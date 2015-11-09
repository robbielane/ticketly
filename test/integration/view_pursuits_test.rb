require 'test_helper'

class ViewPursuitsTest < ActionDispatch::IntegrationTest
  def create_pursuits(num)
    num.times do |i|
      i += 1
      Pursuit.create(name: "Hiking the Alps #{i}", description: "Go hike the alps! #{i}", price: 1000+i) #rou, activity_id: i, location_id: i)
    end
  end

  test 'visitor can see pursuits' do
    create_pursuits(2)
    visit pursuits_path

    assert_equal pursuits_path, current_path

    within("h1") do
      assert page.has_content?("Pursuit")
    end

    within("#hiking_the_alps_1") do
      assert page.has_content?("Go hike the alps! 1")
    end

    within("#hiking_the_alps_2") do
      assert page.has_content?("Go hike the alps! 2")
    end
  end
end
