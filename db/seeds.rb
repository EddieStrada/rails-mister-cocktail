require 'json'
require 'open-uri'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all
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

puts 'Creating Cocktails...'

COCKTAIL_PHOTOS = [
  'https://www.pezproductions.ca/blog/wp-content/uploads/2017/03/cocktails.jpg',
  'https://1920x1080hdwallpapers.com/image/201505/food/1422/cocktail-spray-variegated-olive-dark-650x366.jpg',
  'https://1920x1080hdwallpapers.com/image/201505/food/1418/cocktail-orange-raspberry-coconut-delicious-650x366.jpg',
  'https://1920x1080hdwallpapers.com/image/201505/food/1391/beer-dark-bottle-light-650x366.jpg',
  'https://1920x1080hdwallpapers.com/image/201503/holidays/928/mojito-happiness-resort-drink-650x366.jpg',
  'https://1920x1080hdwallpapers.com/image/201503/holidays/925/wine-barrel-wine-glass-grape-650x366.jpg',
  'https://1920x1080hdwallpapers.com/image/201505/food/1426/cocktail-mojito-lime-ice-mint-raspberry-650x366.jpg',
  'https://1920x1080hdwallpapers.com/image/201505/food/1479/ice-glasses-mojito-lime-palm-beach-650x366.jpg',
  'https://1920x1080hdwallpapers.com/image/201505/food/1480/kiwi-lime-orange-mojito-cocktail-paradise-650x366.jpg',
  'https://1920x1080hdwallpapers.com/image/201505/food/1496/whiskey-goblet-grand-old-parr-vintage-650x366.jpg',
  'https://1920x1080hdwallpapers.com/image/201505/food/1499/bunch-grapes-wine-composition-wine-glass-650x366.jpg',
  'https://www.themadhunter.co.uk/wp-content/uploads/2016/03/drinks-background-600x403.jpg'
]

COCKTAIL_PHOTOS.each do |photo_url|
  cocktail = Cocktail.new(name: Faker::Beer.name)
  cocktail.remote_photo_url = photo_url
  cocktail.save
end
