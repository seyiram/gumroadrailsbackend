# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create(username: "jerry", password: "test", age: 35)

# Create Users
user1 = User.create(username: "Johnny", password: "password")
user2 = User.create(username: "Janey", password: "password")

# Create Products for User 1
product1 = Product.create(name: "Ruby on Rails Tutorial", description: "Learn Rails by Example", url: "http://example.com/rails-tutorial", custom_domain: "rails-tutorial.example.com", cover_image: "rails-tutorial-cover.jpg", thumbnail_image: "rails-tutorial-thumb.jpg", product_type: "e-book", call_to_action: "Buy this", price: 29.99, currency: "USD", user: user1)

product2 = Product.create(name: "React for Beginners", description: "Understanding React and Redux", url: "http://example.com/react-beginners", custom_domain: "react-beginners.example.com", cover_image: "react-beginners-cover.jpg", thumbnail_image: "react-beginners-thumb.jpg", product_type: "course", call_to_action: "I want this", price: 19.99, currency: "USD", user: user1)

# Create Product Details for Product 1
ProductDetail.create(product: product1, attribute_name: "Number of Pages", value: "300")
ProductDetail.create(product: product1, attribute_name: "Format", value: "PDF")

# Create Product Details for Product 2
ProductDetail.create(product: product2, attribute_name: "Video Hours", value: "15")
ProductDetail.create(product: product2, attribute_name: "Includes", value: "Source Code")
