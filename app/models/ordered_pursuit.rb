class OrderedPursuit
  attr_reader :trip_id, :travellers, :name, :price

  def initialize(trip_id, travellers, name, price)
    @trip_id = trip_id
    @travellers = travellers
    @name = name
    @price = price
  end
end
