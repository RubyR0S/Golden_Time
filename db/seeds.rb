# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'test@ukr.net',
             password: '12345678',
             password_confirmation: '12345678')

Category.create!(category_name: "Watches for Men", display: true)
Category.create!(category_name: "Watches for Women", display: true)
Category.create!(category_name: "Watches for Kids", display: true)
Category.create!(category_name: "Mechanic Watch", display: true)
Category.create!(category_name: "Electronic Watch", display: true)

Product.create!(
  name: "Mens Watch",
  description: "Amazing watch for mens",
  price: rand(10..99),
  mens_watch: true,
  category: Category.find(1))

Product.create!(
  name: "Mechanic Watch",
  description: "Amazing watch for all",
  price: rand(10..99),
  mens_watch:     true,
  mechanic_watch: true, 
  category: Category.find(4)
)

Product.create!(
  name: "Electronic Watch",
  description: "Amazing watch for all",
  price: rand(10..99),
  mens_watch:       true,
  electronic_watch: true, 
  category: Category.find(5)
)

Product.create!(
  name: "Womens Watch",
  description: "Amazing watch for womens",
  price: rand(10..99),
  womens_watch:     true,
  category: Category.find(2)
)

Product.create!(
  name: "Kids Watch",
  description: "Amazing watch for kids",
  price: rand(10..99),
  kids_watch:       true,
  category: Category.find(3)
)

Product.create!(
  name: "Womens Watch",
  description: "Amazing watch for womens",
  price: rand(10..99),
  womens_watch:     true,
  electronic_watch: true, 
  category: Category.find(2)
)

Product.create!(
  name: "Kids Watch",
  description: "Amazing watch for kids",
  price: rand(10..99),
  kids_watch:       true,
  electronic_watch: true, 
  category: Category.find(3)
)