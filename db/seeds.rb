class Seed
  def initialize
    generate_user_roles
    generates_user_admins
    generate_vendors
    generate_test_users
    generate_users
    generate_tickets
    generate_orders
    generate_categories
    generate_events
  end

  def generate_user_roles
    Role.create!(name:"registered_user")
    Role.create!(name:"vendor_admin")
    Role.create!(name:"platform_admin")
  end

  def generates_user_admins
    user1 = User.create!(name:"Adam",username:"yung-adam",password:"pass")
    user1.roles << Role.find(1)

    user2 = User.create!(name:"Aaron", username:"yung-aaron", password:"pass")
    user2.roles << Role.find(2)

    user3 = User.create!(name:"Jhun", username:"yung-jhun", password:"pass")
    user3.roles << Role.find(3)

    user4 = User.create!(name:"Robbie", username:"yung-robbie", password:"pass")
    user4.roles << Role.find(2)
  end

  def generate_vendors
    user = User.find(2)
    Vendor.create!(name:"aaron-s-swag-store", user_id: user.id)
    user.update!(vendor_id: 1, password: "pass")

    user2 = User.find(4)
    Vendor.create!(name: "dix-tix", user_id: user2.id)
    user2.update!(vendor_id: 2, password: "pass")
  end

  def generate_test_users
    user = User.create!(username: "aaron",name: "aaron", password: "password")
    user.roles << Role.create!(name: "registered_user")

    status_collection = %w(Completed Paid Cancelled Pending)
    10.times do |i|
      user.orders << Order.create!(
                                    user_id: user,
                                    status: status_collection.sample,
                                    total: Faker::Commerce.price,
                                   )
      puts "#{user.name} is a #{user.role} and got an order! I <3 SEEDS!"
    end
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
      user = User.offset(Random.new.rand(1..user_count)).limit(1).first
      5.times do |i|
        order = user.orders << Order.create!(
                                      status: status_collection.sample,
                                      total: Faker::Commerce.price,
                                      vendor_id: rand(1..2),
                                    )
        puts "Order #{i}: Order for #{user.name} created!"
      end
    end
  end

  def generate_order_tickets
    order_count = Order.count
    ticket_count = Ticket.count
    50.times do |i|
      OrderTicket.create!(
      order_id: rand(1..order_count),
      ticket_id: rand(1..ticket_count)
      )
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
