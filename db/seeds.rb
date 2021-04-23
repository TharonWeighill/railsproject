# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do 
    Bartender.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password, about: Faker::Games::Fallout.quote)
end 

20.times do
    Recipe.create(name: Faker::CryptoCoin.coin_name, directions: Faker::Food.description, category: "Tropical" ) 
end


100.times do
    Ingredient.create(ingredient: Faker::Food.ingredient) 
end

Ingredient.create(ingredient: "Vodka")
Ingredient.create(ingredient: "Gin")
Ingredient.create(ingredient: "Whisky")
Ingredient.create(ingredient: "Tequila")
Ingredient.create(ingredient: "Rum")
Ingredient.create(ingredient: "Mezcal")
Ingredient.create(ingredient: "Scotch")