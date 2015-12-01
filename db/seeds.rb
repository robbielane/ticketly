class Seed
  def initialize
    generate_users
    generate_orders
    #generate_pursuits
  end

<<<<<<< HEAD
  def generate_users
    50.times do |i|
      user = User.create!(
        name: Faker::Name.name,
        username: "#{Faker::Internet.user_name}#{i}", 
        password: "password"
      )
      puts "User #{i}:#{user.username} completed!"
    end
  end


  def generate_pursuits
    Pursuit.create(name: "Jetskiing", description: "Fun in the sun!", price: 150)
    Pursuit.create(name: "Skiing", description: "Powder snow in the Alps", price: 750)
    Pursuit.create(name: "Hiking", description: "South America tour through Argentina & Chile", price: 1150)
  end

  def generate_orders
    user_count = User.count
    status_collection = %w(Completed Paid Cancelled Pending)
    100.times do |i|
      user = User.offset(Random.new.rand(1..user_count)).limit(1)
      5.times do |i|
        user.orders << Order.create!(
                                      user_id: user,
                                      status: status_collection.sample,
                                      total: Faker::Commerce.price,
                                    )
        puts "Order #{i}: Order for #{user.name} created!"
      end
    end
  end
end

Seed.new
=======
Ticket.create(name: "Jetskiing", price: 150)
Ticket.create(name: "Skiing", price: 750)
Ticket.create(name: "Hiking", price: 1150)

User.create(username: "aaron", name: "Aaron", password: "pass")
User.create(username: "torie", name: "Torie", password: "pass")
User.create(username: "cole", name: "Cole", password: "pass", role: 1)

Order.create(user_id: 1, status: "Completed", total: 1000, created_at: "2015-10-18 21:56:18", updated_at: "2015-10-18 21:56:18")
Order.create(user_id: 2, status: "Paid", total: 10000, created_at: "2015-09-18 21:56:18", updated_at: "2015-09-18 21:56:18")
Order.create(user_id: 3, status: "Cancelled", total: 8000, created_at: "2015-11-18 21:56:18", updated_at: "2015-11-18 21:56:18")

Activity.create(name: "Catching Pokemon")
Activity.create(name: "Beating up Gary Oak")
Activity.create(name: "Playing the poke flute")
>>>>>>> master
