require "test_helper"

class TicketTest < ActiveSupport::TestCase
  def setup
    Category.create(name: "Hiking")
  end

  def valid_attributes
    {
      name: "Hiking in the Alps",
      price: 1001,
      category_id: Category.find_by_name("Hiking").id
    }
  end

  test "a valid ticket can be created" do
    ticket = Ticket.new(valid_attributes)
    assert ticket.valid?
  end

  test "it is invalid with missing name" do
    ticket = Ticket.new( price: 1001,
                        category_id: Category.find_by_name("Hiking").id)

    refute ticket.valid?
  end

  test "it is invalid with missing price" do
    ticket = Ticket.new(name: "Hiking in the alps",
                        category_id: Category.find_by_name("Hiking").id)

    refute ticket.valid?
  end

  test "it must belong to an category" do
    ticket = Ticket.new(name: "Hiking in the alps",
                        price: 1000)

    refute ticket.valid?
  end



  test "it must have a price that is greater than zero" do
    ticket = Ticket.new({ name: "Hiking in the Alps",
                          price: -1,
                          category_id: Category.find_by_name("Hiking").id
                          })

    refute ticket.valid?
  end
end
