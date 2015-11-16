require "test_helper"

class PursuitTest < ActiveSupport::TestCase
  def valid_attributes
    {
      name: "Hiking in the Alps",
      description: "Hike The Alps!",
      price: 1001
    }
  end

  test "a valid pursuit can be created" do
    pursuit = Pursuit.new(valid_attributes)
    assert pursuit.valid?
  end

  test "a pursuit is invalid with missing name" do
    pursuit = Pursuit.new(description: "Hike The Alps!", price: 1001)

    refute pursuit.valid?
  end

  test "a pursuit is invalid with missing description" do
    pursuit = Pursuit.new(name: "Hiking in the alps", price: 1001)

    refute pursuit.valid?
  end

  test "a pursuit is invalid with missing price" do
    pursuit = Pursuit.new(name: "Hiking in the alps", description: "Hike The Alps!")

    refute pursuit.valid?
  end
end
