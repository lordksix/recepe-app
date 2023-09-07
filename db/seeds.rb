# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Recipe.destroy_all
Food.destroy_all
User.destroy_all

quantity_users = 10
quantity_foods = 15
quantity_recipes = 20
users = []

for user_position in 1..quantity_users do
  temp_user = User.create!(
    email: "email#{user_position}@email.com",
    password: "abcdef"
  )
  #temp_user.skip_confirmation!
  temp_user.save!
  users << temp_user
end

for user_position in 0..(quantity_users - 1) do
  for food_position in 0..Random.rand(quantity_foods) do
    temp_food = Food.create!(
      user: users[user_position],
      name: "Food ##{food_position + 1}",
      measurement_unit: "grams",
      price: 10.0,
      quantity: food_position
    )
  end
  for food_position in 0..Random.rand(quantity_recipes) do
    public = true
    public = false if food_position.odd?
    temp_food = Recipe.create!(
      user: users[user_position],
      name: "Recipe ##{food_position + 1}",
      preparation_time: "1 hour",
      cooking_time: "2.5 hours",
      description: "This is the first one",
      public: public
    )
  end
end

puts "Created #{User.count} users"
puts "Created #{Food.count} food items"
puts "Created #{Recipe.count} recipes"
