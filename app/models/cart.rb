class Cart
  attr_reader :trips

  def intialize(raw_data)
    @trips = raw_data || {}
  end

  def add_trip(pursuit_id)
    trips[pursuit_id.to_s] ||= 0
    trips[pursuit_id.to_s] += 1
  end

  

end
