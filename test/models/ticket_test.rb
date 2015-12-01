require "test_helper"

class TicketTest < ActiveSupport::TestCase
  def setup
    Activity.create(name: "Hiking")
  end

  def valid_attributes
    {
      name: "Hiking in the Alps",
      price: 1001,
      activity_id: Activity.find_by_name("Hiking").id
    }
  end

  test "a valid ticket can be created" do
    ticket = Ticket.new(valid_attributes)
    assert ticket.valid?
  end

  test "it is invalid with missing name" do
    ticket = Ticket.new( price: 1001,
                        activity_id: Activity.find_by_name("Hiking").id)

    refute ticket.valid?
  end

  test "it is invalid with missing price" do
    ticket = Ticket.new(name: "Hiking in the alps",
                        activity_id: Activity.find_by_name("Hiking").id)

    refute ticket.valid?
  end

  test "it must belong to an activity" do
    ticket = Ticket.new(name: "Hiking in the alps",
                        price: 1000)

    refute ticket.valid?
  end



  test "it must have a price that is greater than zero" do
    ticket = Ticket.new({ name: "Hiking in the Alps",
                          price: -1,
                          activity_id: Activity.find_by_name("Hiking").id
                          })

    refute ticket.valid?
  end
end
