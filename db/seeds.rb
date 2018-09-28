# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
Product.create(name: 'Steaks',
               description: 'Delicious steaks',
               price: 12.50,
               image_url: 'default_food.jpg')

User.create(name: "test1",
            email: "test1@test.com",
            password: "parola1234",
            password_confirmation: "parola1234")

User.create(name: "test2",
            email: "test2@test.com",
            password: "parola1234",
            password_confirmation: "parola1234")

User.create(name: "test",
            email: "admin@test.com",
            password: "parola1234",
            password_confirmation: "parola1234")