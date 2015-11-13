class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_trips
  has_many :pursuits, through: :ordered_trips

  def self.make_new(cart, current_user)
    order = current_user.orders.create
    cart.ordered_pursuits.each do |pursuit|
      order.ordered_trip.create(pursuit_id: pursuit.pursuit_id,
                                travellers: pursuit.travellers,
                                price: pursuit.price)
    end
  end
end
