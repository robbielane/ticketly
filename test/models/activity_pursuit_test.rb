require 'test_helper'

class ActivityTicketTest < ActiveSupport::TestCase
  test "tickets are linked to activities" do
    hiking = Activity.create(name: "hiking")

    ticket_in_germany = Ticket.create(name: "hiking in the alps", activity_id: hiking.id)
    ticket_in_mexico = Ticket.create(name: "hike the Pico de Orizaba", activity_id: hiking.id)

    assert_equal "hiking", ticket_in_germany.activity.name
  end
end
