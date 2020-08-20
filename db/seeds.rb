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

user = User.create(email: "admin@fluffybikes.com", username: Faker::Internet.username, password: "password")


puts 'Creating users'
  3.times do
    user = User.create(email: Faker::Internet.email, username: Faker::Internet.username, password: Faker::Internet.password)
  end


puts 'Creating districts'

district_seeds = [
  "Charlottenburg-Wilmersdorf",
  "Friedrichshain-Kreuzberg",
  "Lichtenberg",
  "Marzahn-Hellersdorf",
  "Mitte",
  "Pankow",
  "Reinickendorf",
  "Spandau",
  "Steglitz-Zehlendorf",
  "Tempelhof-Schöneberg",
  "Treptow-Köpenick"
]

district_seeds.each do |seed|
  District.create(name: seed)
end


puts 'Creating bikes'

image_seeds = [
  "https://res.cloudinary.com/dg106nng3/image/upload/v1597837447/bike_seeds/website_home_ogi_6_rharht.png",
  "https://res.cloudinary.com/dg106nng3/image/upload/v1597837447/bike_seeds/1280px-Loaded_touring_bicycle_t7hq83.jpg",
  "https://res.cloudinary.com/dg106nng3/image/upload/v1597837447/bike_seeds/urwahn_stadtfuchs_preview_pca3u2.jpg",
  "https://res.cloudinary.com/dg106nng3/image/upload/v1597837447/bike_seeds/1920px-Left_side_of_Flying_Pigeon_wzrw5g.jpg",
  "https://res.cloudinary.com/dg106nng3/image/upload/v1597837446/bike_seeds/Kona-Unit-X-Review_8_rshb6k.jpg",
  "https://res.cloudinary.com/dg106nng3/image/upload/v1597837446/bike_seeds/2400x1256_Airisto_Commuter_Skyblue_coabfs.jpg",
  "https://res.cloudinary.com/dg106nng3/image/upload/v1597837446/bike_seeds/15655615295_3a46e83728_b_k6kivw.jpg",
  "https://res.cloudinary.com/dg106nng3/image/upload/v1597837446/bike_seeds/slider_slide_4_image_bnqbzd.jpg",
  "https://res.cloudinary.com/dg106nng3/image/upload/v1597837446/bike_seeds/PEDL-Zoomcar_iumr5v.jpg",
  "https://res.cloudinary.com/dg106nng3/image/upload/v1597837446/bike_seeds/EYT6SKrWAAIlP8x_kehiuj.jpg"
]


image_seeds.each do |seed|
  bike = Bike.new(title: Faker::Hipster.word, description: Faker::Hipster.paragraph, user_id: rand(User.first.id..User.last.id))
  file = URI.open(seed)
  bike.photo.attach(io: file, filename: 'bd.jpg', content_type: 'image/jpg')
  bike.district_id = rand(District.first.id..District.last.id)
  bike.save
end
  # 10.times do
  #  bike = Bike.create(title: Faker::Hipster.word, description: Faker::Hipster.paragraph, user_id: rand(User.first.id..User.last.id))
  #  booking = Booking.create(starting_date: Faker::Date.in_date_period, end_date: Faker::Date.in_date_period,bike_id: bike.id, user_id: rand(User.first.id..User.last.id))
  #end



puts 'Database created'
