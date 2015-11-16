require "test_helper"

class PursuitTest < ActiveSupport::TestCase
  def setup
    Activity.create(name: "Hiking")
  end

  def valid_attributes
    {
      name: "Hiking in the Alps",
      description: "Hike The Alps!",
      price: 1001,
      activity_id: Activity.find_by_name("Hiking").id
    }
  end

  test "a valid pursuit can be created" do
    pursuit = Pursuit.new(valid_attributes)
    assert pursuit.valid?
  end

  test "it is invalid with missing name" do
    pursuit = Pursuit.new(description: "Hike The Alps!",
                          price: 1001,
                          activity_id: Activity.find_by_name("Hiking").id)

    refute pursuit.valid?
  end

  test "it is invalid with missing description" do
    pursuit = Pursuit.new(name: "Hiking in the alps",
                          price: 1001,
                          activity_id: Activity.find_by_name("Hiking").id)

    refute pursuit.valid?
  end

  test "it is invalid with missing price" do
    pursuit = Pursuit.new(name: "Hiking in the alps",
                          description: "Hike The Alps!",
                          activity_id: Activity.find_by_name("Hiking").id)

    refute pursuit.valid?
  end

  test "it must belong to an activity" do
    pursuit = Pursuit.new(name: "Hiking in the alps",
                          description: "Hike the Alps!",
                          price: 1000)

    refute pursuit.valid?
  end

  # test "it must have a unique name" do
  #   pursuit = Pursuit.create(valid_attributes)
  #   pursuit = Pursuit.new(valid_attributes)
  #
  #   refute pursuit.valid?
  # end

  test "it must have a price that is greater than zero" do
    pursuit = Pursuit.new( { name: "Hiking in the Alps",
                             description: "Hike The Alps!",
                             price: -1,
                             activity_id: Activity.find_by_name("Hiking").id
                           })

    refute pursuit.valid?
  end
end
