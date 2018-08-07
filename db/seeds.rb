# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Category.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE products_id_seq RESTART WITH 1")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE categories_id_seq RESTART WITH 1")

cat1 = Category.create!(title: 'Book124')

Product.create!(title: 'RUby book', desciption: 'Learn Ruby programing', price: 12, published: true, category_id: cat1.id)
p1 = Product.create!(title: 'Jquery book', desciption: 'Learn Jquery', price: 11, published: true)
p2 = Product.create!(title: 'SASS book', desciption: 'Learn CSS with SASS', price: 20, published: true)
p3 = Product.create!(title: 'Japan book', desciption: 'Learn Japan', price: 40, published: true)

cat1.products << p1
cat1.products << p2
cat1.products << p3

puts p1.category.title

cat1.products.each do |p|
 puts p
end
