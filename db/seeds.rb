class Seed
  def initialize
    generate_test_users
    generate_users
    generate_orders
    generate_categories
    generate_events
    generate_tickets
  end

  def generate_test_users
    user = User.create!(username: "aaron",name: "aaron", password: "password")
    user.roles << Role.create!(name: "registered_user")
  end

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

  def generate_orders
    user_count = User.count
    status_collection = %w(Completed Paid Cancelled Pending)
    100.times do |i|
      user = User.offset(Random.new.rand(1..user_count)).limit(1)
      5.times do |i|
        order = user.orders << Order.create!(
                                      user_id: user,
                                      status: status_collection.sample,
                                      total: Faker::Commerce.price,
                                    )
        puts "Order #{i}: Order for #{user.name} created!"
      end
    end
  end

  def generate_categories
    categories = %w(Concerts Sports Kids)
    categories.each do |category|
      Category.create!(name: category)
    end
  end

  def generate_events
    category_count = Category.count
    100.times do |i|
      Event.create!(
        name: Faker::Hipster.words(2).join(' '),
        description: Faker::Hipster.words(8).join(' '),
        location_city: Faker::Address.city,
        location_state: Faker::Address.state_abbr,
        venue: Faker::Hipster.words(2).join(' '),
        date_time: Faker::Time.between(DateTime.now, 150.days.from_now),
        category_id: rand(1..category_count)
      )
      puts "Event #{i}: Event created!"
    end
  end

  def generate_tickets
    category_count = Category.count
    event_count = Event.count
    1000.times do |i|
      event_id = rand(1..event_count)
      Ticket.create!(
        price: rand(30..1000),
        category_id: rand(1..category_count),
        section: rand(1..400),
        row: rand(1..50),
        seat: rand(1..30),
        event_id: event_id
      )
      puts "Ticket #{i}: Ticket created for event ##{event_id}"
    end
  end

end

Seed.new
