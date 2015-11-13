class Cart
  attr_reader :trips

  def initialize(raw_data)
    @trips = raw_data || {}
  end

  def add_trip(pursuit_id)
    trips[pursuit_id.to_s] ||= 0
    trips[pursuit_id.to_s] += 1
  end

  def total_trips
    trips.to_a.count
  end

  def count_of(pursuit_id)
    trips[pursuit_id.to_s]
  end

  def remove(trip)
    trips.delete(trip.id.to_s)
  end

  def ordered_pursuits
    trips.map do |pursuit_id, travellers|
      pursuit = Pursuit.find(pursuit_id.to_i)
      OrderedPursuit.new(pursuit_id, travellers, pursuit.price)
    end
  end
end
