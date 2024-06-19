# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Rails UI already generated user accounts on install but you can create more here.

User.destroy_all
Book.destroy_all

user_1 = User.create(name: "Andy Leverenz", email: "andy.doe@example.com", password: "password", password_confirmation: "password")

user_2 = User.create(name: "Jane Blah", email: "jane.blah@example.com", password: "password", password_confirmation: "password")

user_3 = User.create(name: "Travis Smith", email: "travis.smith@example.com", password: "password", password_confirmation: "password")

20.times do
  Book.create!(title: Faker::Book.title, description: Faker::Lorem.paragraph(sentence_count: 3), user: [user_1, user_2, user_3].sample)
end
