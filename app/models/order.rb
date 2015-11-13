class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_trip

  def self.make_new(cart, current_user)
    order = current_user.orders.create
    cart.ordered_pursuits.each do |pursuit|
      order.ordered_trip.create(id: pursuit.trip_id,
                                name: pursuit.name,
                                travellers: pursuit.travellers,
                                price: pursuit.price)
    end
  end
end
