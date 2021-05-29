# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {
    username: 'Denis',
    email: 'admin@admin.com',
    password: 'admin1234',
    admin: true
  },
  {
    username: 'Atef',
    email: 'user@admin.com',
    password: 'user1234',
    admin: false
  }
])

30.times do
  Car.create([
    {
      make: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      year: Faker::Vehicle.year,
      color: Faker::Vehicle.color,
      transmission: Faker::Vehicle.transmission,
      seats: 5,
      image_url: "https://source.unsplash.com/800x600/?car,#{Faker::Vehicle.color.downcase}"
    }
  ])
end
