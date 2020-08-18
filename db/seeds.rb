# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
Booking.destroy_all
Bike.destroy_all
User.destroy_all

puts 'Creating users'
  3.times do
    user = User.create(email: Faker::Internet.email, username: Faker::Internet.username, password: Faker::Internet.password)
  end

puts 'Creating bikes'

  10.times do
    bike = Bike.create(title: Faker::Hipster.word, description: Faker::Hipster.paragraph, user_id: rand(User.first.id..User.last.id))
    booking = Booking.create(starting_date: Faker::Date.in_date_period, end_date: Faker::Date.in_date_period,bike_id: bike.id, user_id: rand(User.first.id..User.last.id))
  end

puts 'Database created'

