class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_trip

  def self.make_new(cart, current_user)
    order = current_user.order.create
    cart.trips.each do |trip, travellers|
      trip_price = Pursuit.find(trip.to_i).price
      trip_name = Pursuit.find(trip.to_i).name
      travellers = cart.trips.values.first
      subtotal = trip_price * travellers
      order.ordered_trip.create(id: trip.to_i, name: trip_name, travellers: travellers, price: subtotal)
    end
  end
end
