# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kim = User.create(username: "kim", password_digest: "password")

game1 = Game.create(user_id: kim.id, distance: 11.111, time: 2.222, avg_velocity: 5.001)
game2 = Game.create(user_id: kim.id, distance: 33.333, time: 4.444, avg_velocity: 7.501)


