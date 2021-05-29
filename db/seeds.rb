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

cars = Car.create([
  {
    make: 'Ford',
    model: 'Shelby Mustang GT 500',
    year: 1965,
    color: 'Red',
    transmission: 'Manual',
    seats: 2,
    image_url: 'https://coolmaterial.com/wp-content/uploads/2018/01/1967-Shelby-GT500.jpg'
  },
  {
    make: 'Kia',
    model: 'K5',
    year: 2012,
    color: 'White',
    transmission: 'Automatic',
    seats: 5,
    image_url: 'http://carsot.com/images/kia-k5-i-2010-2013-sedan-exterior-1.jpg'
  },
  {
    make: 'Hyundai',
    model: 'Sonata LPI',
    year: 2015,
    color: 'White',
    transmission: 'Automatic',
    seats: 5,
    image_url: 'https://i.ytimg.com/vi/jGtT3CKCAxM/maxresdefault.jpg'
  },
  {
    make: 'Mercedes-Benz',
    model: 'Class 63 AMG',
    year: 2015,
    color: 'Grey',
    transmission: 'Sequential',
    seats: 5,
    image_url: 'https://s1.cdn.autoevolution.com/images/gallery/MERCEDES-BENZ-CLS-63-AMG--C219--1541_19.jpg'
  },
  {
    make: 'Tesla',
    model: 'Model S',
    year: 2015,
    color: 'Red',
    transmission: 'Manual',
    seats: 5,
    image_url: 'https://sciencepost.fr/wp-content/uploads/2016/06/4-23.jpg'
  }
])

BookedCar.create([
  {
    user: users.first,
    car: cars.first
  },
  {
    user: users.last,
    car: cars.last
  }
])
