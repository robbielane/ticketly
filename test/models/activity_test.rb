require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test "an activity can be creted" do
    activity = Activity.new(name: "Hiking")
    assert activity.valid?
  end
end
