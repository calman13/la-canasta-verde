# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Removing Products"
Product.delete_all

puts "Removing shops"
Shop.delete_all

puts "Removing users"
User.delete_all

puts 'Creating users...'

10.times do 
  user = User.new(
    first_name: "#{Faker::Name.first_name }",
    last_name:"#{Faker::Name.last_name}",
    email:"#{Faker::Internet.email}",
    phone:"987656787", 
    address: "#{Faker::Address.street_address}", 
    password:"123456"
  )

  puts 'Creating shops...'
  3.times do
    shop = Shop.new(
      name: "#{Faker::Commerce.department}",
      history: "#{Faker::Lorem.sentence(word_count: 8)}",
      image:"https://http2.mlstatic.com/D_NQ_NP_949596-MLA44018322969_112020-O.webp"
    )
    user.shops << shop
    shop.save

    puts 'Creating products...'
    10.times do
      product = Product.new(title: "#{Faker::Food.fruits}", description: "#{Faker::Food.description}", price: "#{rand(100..10000)}", amount: "#{rand(15..100)}")
      user.shops.last.products << product
      product.save
    end

    p user
    p user.shops
    p user.shops.last.products
  end
end


