require 'test_helper'

class CategoryTicketTest < ActiveSupport::TestCase
  test "tickets are linked to categories" do
    hiking = Category.create(name: "hiking")

    ticket_in_germany = Ticket.create(name: "hiking in the alps", category_id: hiking.id)
    ticket_in_mexico = Ticket.create(name: "hike the Pico de Orizaba", category_id: hiking.id)

    assert_equal "hiking", ticket_in_germany.category.name
  end
end
