# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pursuit.create(name: "Jetskiing", description: "Fun in the sun!", price: 150)
Pursuit.create(name: "Skiing", description: "Powder snow in the Alps", price: 750)
Pursuit.create(name: "Hiking", description: "South America tour through Argentina & Chile", price: 1150)

User.create(username: "aaron", name: "Aaron", password: "pass")
User.create(username: "torie", name: "Torie", password: "pass")
User.create(username: "cole", name: "Cole", password: "pass")
