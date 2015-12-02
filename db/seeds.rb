class Seed
  def initialize
    generate_users
    generate_orders
    generate_categories
    generate_tickets
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
    category_names = %w(sporting music film live admission festival special)
    category_names.each do |category|
      category = Category.create!(
        name: category
      )
      puts "Category: #{category.name} completed!"
    end
  end

  def generate_tickets
    category_names = Category.all
    500.times do |i|
      ticket = Ticket.create!(
                     name: Faker::Lorem.word,
                     price: Faker::Commerce.price,
                     category_id: category_names.sample.id 
                    )
      puts "Ticket #{i}: #{ticket.name} created"
    end
  end
end

Seed.new
