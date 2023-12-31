# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |i|
  puts "*** Creating Batch##{i + 1} of 1000 users ***"; puts
  
  1_000.times do
    User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      phone_no: Faker::PhoneNumber.phone_number,
      location: Faker::Address.full_address
    )
  end

  puts "*** Successfully processed Batch##{i + 1}. Users count: #{User.count} ***"; puts
end