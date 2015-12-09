class Seed
  def initialize
    generate_user_roles
    generates_user_admins
    generate_users
    generate_test_users
    generate_vendors
    generate_categories
    generate_events
    generate_tickets
    generate_orders
    generate_order_tickets
  end

  def locations
    ["New York NY", "Los Angeles CA", "Chicago IL", "Houston TX", "Phoenix AZ", "Philadelphia PA", "San Antonio TX", "Dallas TX", "San Diego CA", "San Jose CA", "Detroit MI", "San Francisco CA", "Jacksonville FL", "Indianapolis IN", "Austin TX", "Columbus OH", "Fort Worth TX", "Charlotte NC", "Memphis TN", "Baltimore MD", "El Paso TX", "Boston MA", "Milwaukee WI", "Denver CO", "Seattle WA", "Nashville TN", "Washington DC", "Las Vegas NV", "Portland OR", "Louisville KY", "Oklahoma City OK", "Tucson AZ", "Atlanta GA", "Albuquerque NM", "Fresno CA", "Sacramento CA", "Long Beach CA", "Mesa AZ", "Kansas City MO", "Omaha NE", "Cleveland OH", "Virginia Beach VA", "Miami FL", "Oakland CA", "Raleigh NC", "Tulsa OK", "Minneapolis MN", "Colorado Springs CO", "Honolulu HI", "Arlington TX", "Wichita KS", "St. Louis MO", "Tampa FL", "Santa Ana CA", "Anaheim CA", "Cincinnati OH", "Bakersfield CA"," Aurora CO", "New Orleans LA", "Pittsburgh PA", "Riverside CA", "Toledo OH", "Stockton CA", "Corpus Christi TX", "Lexington KY", "St. Paul MN", "Anchorage AK", "Newark NJ", "Buffalo NY", "Plano TX", "Henderson NV", "Lincoln NE", "Fort Wayne IN", "Glendale AZ", "Greensboro NC", "Chandler AZ", "St. Petersburg FL", "Jersey City NJ"]
  end

  def generate_user_roles
    Role.create!(name:"registered_user")
    Role.create!(name:"vendor_admin")
    Role.create!(name:"platform_admin")
  end

  def generates_user_admins
    user1 = User.create!(name:"Adam",
                         username:"yung-adam",
                         password:"pass",
                         email: "adajensen@gmail.com")
    user1.roles << Role.find(1)

    user2 = User.create!(name:"Aaron",
                         username:"yung-aaron",
                         password:"pass",
                         email: "yung-aaron@yungski.com")
    user2.roles << Role.find(2)

    user3 = User.create!(name:"Jhun",
                         username:"yung-jhun",
                         password:"pass",
                         email: "yung-jhun@jhunbug.com")
    user3.roles << Role.find(3)

    user4 = User.create!(name:"Robbie", username:"yung-robbie", password:"pass")
    user4.roles << Role.find(2)
  end

  def generate_vendors
    user = User.find(2)
    Vendor.create!(name:"aaron-s-swag-store", user_id: user.id, status: 0)
    user.update!(vendor_id: 1, password: "pass")

    user2 = User.find(4)
    Vendor.create!(name: "dix-tix", user_id: user2.id, status: 1)
    user2.update!(vendor_id: 2, password: "pass")

    20.times do |i|
      rand_user = User.find(i + 20)
      name = Faker::Company.name + " tickets"
      vendor = Vendor.create!(name: name, user_id: rand_user.id, status: 1)
      rand_user.update!(vendor_id: vendor.id, password: "password")
    end
  end

  def generate_test_users
    user = User.create!(username: "aaron",
                        name: "aaron1",
                        password: "password",
                        email: "yung-aaron@yungski.com")
    user.roles << Role.find(1)

    status_collection = %w(Completed Paid Cancelled Pending)
    10.times do |i|
      user.orders << Order.create!(
                                    user_id: user,
                                    status: status_collection.sample,
                                    total: Faker::Commerce.price,
                                   )
      puts "#{user.name} is a #{user.role} and got an order! I <3 YUNG SEEDS!"
    end
  end

  def generate_users
    50.times do |i|
      user = User.create!(
        name: Faker::Name.name,
        username: "#{Faker::Internet.user_name}#{i}",
        password: "password",
        email: Faker::Internet.safe_email
      )
      puts "User #{i}:#{user.username} completed!"
    end
  end

  def generate_orders
    user_count = User.count
    status_collection = %w(Completed Paid Cancelled Pending)
    100.times do |i|
      user = User.find(rand(1..(user_count-1)))

      5.times do |i|
        order = user.orders << Order.create!(
                                      status: status_collection.sample,
                                      total: Faker::Commerce.price,
                                      vendor_id: rand(1..22),
                                    )
        puts "Order #{i}: Order for #{user.name} created!"
      end
    end
  end

  def generate_order_tickets
    order_count = Order.count
    ticket_count = Ticket.count
    500.times do |i|
      OrderTicket.create!(
      order_id: rand(1..order_count),
      ticket_id: rand(1..ticket_count)
      )
      puts "Ticket added to order"
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
      location = locations.sample
      Event.create!(
        name: Faker::Hipster.words(2).join(' '),
        description: Faker::Hipster.words(8).join(' '),
        location_city: location[0..-4],
        location_state: location[-2..-1],
        venue: Faker::Hipster.words(2).join(' '),
        date_time: Faker::Time.between(DateTime.now - 30, 150.days.from_now),
        category_id: rand(1..category_count)
      )
      puts "Event #{i}: Event created!"
    end
  end

  def generate_tickets
    event_count = Event.count
    1000.times do |i|
      event_id = rand(1..event_count)
      Ticket.create!(
        price: rand(30..1000),
        section: rand(1..400),
        row: rand(1..50),
        seat: rand(1..30),
        event_id: rand(1..event_count),
        vendor_id: rand(1..22)
      )

      puts "Ticket #{i}: Ticket created for event ##{event_id}"
    end
  end

end

Seed.new
