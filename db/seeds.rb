require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all

puts 'Creating seeds...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)
user['drinks'].each do |hash|
  Ingredient.create(name: hash['strIngredient1'])
end

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# Ingredient.create(name: "water")
# Ingredient.create(name: "soda")
# Ingredient.create(name: "cherry")
# Ingredient.create(name: "red bull")
# Ingredient.create(name: "vodka")
# Ingredient.create(name: "gin")
# Ingredient.create(name: "tequila")
# Ingredient.create(name: "beer")
# Ingredient.create(name: "sugar")
# Ingredient.create(name: "salt")
# Ingredient.create(name: "pepper sauce")

puts 'seeds created...'
