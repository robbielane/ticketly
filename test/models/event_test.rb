require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def valid_attributes
    {
      name: 'Amazing Concert',
      description: 'Amazing description',
      venue: 'Pepsi Center',
      location_city: 'Dever',
      location_state: 'CO',
      category_id: 1,
      date_time: '2016-04-04 20:00:00'
    }
  end

  test 'a valid event can be created' do
    event = Event.new(valid_attributes)

    assert event.valid?
  end

  test 'is invalid without a name' do
    event = Event.new(valid_attributes)
    event.name = nil

    refute event.valid?
  end

  test 'is invalid without a venue' do
    event = Event.new(valid_attributes)
    event.venue = nil

    refute event.valid?
  end

  test 'is invalid without a location_city' do
    event = Event.new(valid_attributes)
    event.location_city = nil

    refute event.valid?
  end

  test 'is invalid without a location_state' do
    event = Event.new(valid_attributes)
    event.location_state = nil

    refute event.valid?
  end

  test 'it responds to tickets' do
    event = Event.first

    assert event.respond_to?(:tickets)
  end

  test 'it responds to category' do
    event = Event.first

    assert event.respond_to?(:category)
  end
end
