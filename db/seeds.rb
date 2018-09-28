# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
Product.create(name: 'Steaks1',
               description: 'Delicious steaks1',
               price: 12.50,
               image_url: 'default_food.jpg')

Product.create(name: 'Steaks2',
               description: 'Delicious steaks2',
               price: 12.50,
               image_url: 'default_food.jpg')
Product.create(name: 'Steaks3',
               description: 'Delicious steaks3',
               price: 12.50,
               image_url: 'default_food.jpg')
Product.create(name: 'Steaks4',
               description: 'Delicious steaks4',
               price: 12.50,
               image_url: 'default_food.jpg')
Product.create(name: 'Steaks5',
               description: 'Delicious steaks5',
               price: 12.50,
               image_url: 'default_food.jpg')
Product.create(name: 'Steaks6',
               description: 'Delicious steaks6',
               price: 12.50,
               image_url: 'default_food.jpg')
Product.create(name: 'Steaks7',
               description: 'Delicious steaks7',
               price: 12.50,
               image_url: 'default_food.jpg')
Product.create(name: 'Steaks8',
               description: 'Delicious steaks8',
               price: 12.50,
               image_url: 'default_food.jpg')
Product.create(name: 'Steaks9',
               description: 'Delicious steaks9',
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