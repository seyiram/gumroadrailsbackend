# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create 5 users
5.times do |i|
  User.create(
    username: "User_#{i + 1}",
    password: "password", # Ensure to hash passwords appropriately
    age: rand(18..50), # Random age between 18 and 50
    bio: "Bio of User #{i + 1}",
    name: "Name_#{i + 1}",
    twitter_handle: "@user#{i + 1}",
    gumroad_user_id: SecureRandom.hex(10), # Random gumroad user ID
    url: "http://user#{i + 1}.example.com"
  )
end

# Fetch the created users
users = User.all

# Product sample data
product_names = ["Product A", "Product B", "Product C", "Product D", "Product E"]
product_types = ["e-book", "course", "membership", "physical", "bundle"]
currencies = ["USD", "EUR", "GBP"]

# For each user, create 10 products
users.each do |user|
  10.times do |j|
    user.products.create(
      name: "#{product_names.sample} #{j + 1}", # Random product name
      user_product_number: i + 1,
      description: "Description for #{product_names.sample} #{j + 1}",
      url: "http://example.com/product_#{j + 1}",
      custom_domain: "product#{j + 1}.example.com",
      cover_image: "cover_image_#{j + 1}.jpg",
      thumbnail_image: "thumbnail_#{j + 1}.jpg",
      product_type: product_types.sample, # Random product type
      call_to_action: "Buy Now",
      price: rand(10..100), # Random price between 10 and 100
      currency: currencies.sample, # Random currency
      published: [true, false].sample # Randomly published or not
      # Add other product fields as needed
    )
  end
end

puts "Database seeded successfully."
