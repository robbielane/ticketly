require 'test_helper'

class ActivityPursuitTest < ActiveSupport::TestCase
  test "pursuits are linked to activities" do
    hiking = Activity.create(name: "hiking")

    pursuit_in_germany = Pursuit.create(name: "hiking in the alps", description: "hike the alps!", activity_id: hiking.id)
    pursuit_in_mexico = Pursuit.create(name: "hike the Pico de Orizaba", description: "hike in mexico!", activity_id: hiking.id)

    assert_equal "hiking", pursuit_in_germany.activity.name
  end
end
