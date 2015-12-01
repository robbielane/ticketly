# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ticket.create(name: "Jetskiing", price: 150)
Ticket.create(name: "Skiing", price: 750)
Ticket.create(name: "Hiking", price: 1150)

User.create(username: "aaron", name: "Aaron", password: "pass")
User.create(username: "torie", name: "Torie", password: "pass")
User.create(username: "cole", name: "Cole", password: "pass")

Order.create(user_id: 1, status: "Completed", total: 1000, created_at: "2015-10-18 21:56:18", updated_at: "2015-10-18 21:56:18")
Order.create(user_id: 2, status: "Paid", total: 10000, created_at: "2015-09-18 21:56:18", updated_at: "2015-09-18 21:56:18")
Order.create(user_id: 3, status: "Cancelled", total: 8000, created_at: "2015-11-18 21:56:18", updated_at: "2015-11-18 21:56:18")

Activity.create(name: "Catching Pokemon")
Activity.create(name: "Beating up Gary Oak")
Activity.create(name: "Playing the poke flute")
