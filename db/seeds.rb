# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE products_id_seq RESTART WITH 1")

Product.create!(title: 'RUby book', desciption: 'Learn Ruby programing', price: 12, published: true)
Product.create!(title: 'Jquery book', desciption: 'Learn Jquery', price: 11, published: true)
Product.create!(title: 'SASS book', desciption: 'Learn CSS with SASS', price: 20, published: true)
