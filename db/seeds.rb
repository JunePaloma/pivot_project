# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
#
#
# CATEGORIES = ["Bath", "Furniture", "Kitchen", "Mattresses", "Seasonal"]
#
# CATEGORIES.each do |category|
#   created = Category.create(name: category)
#   puts "Created #{created.name} category."
# end
#
# # -----------------------------Furniture
# puts "Creating Furniture Items"
# Item.create(name: "Reduced Height Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture1.png")
# Item.create(name: "Pallet Chic Backyard Set", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture2.png")
# Item.create(name: "Distressed Beach Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture3.png")
# Item.create(name: "Antique Entertainment Center", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture4.png")
# Item.create(name: "Shabby Chic Retro Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture5.png")
# Item.create(name: "Extended Storage Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture6.png")
# Item.create(name: "Dual Tone Distressed Deconstructed Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture7.png", active: false)
# Item.create(name: "Overstuffed Deconstruced Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture8.png")
# Item.create(name: "Floral Pattern Yard Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture9.png", active: false)
# Item.create(name: "Wasteland Chic Chaise", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture10.png")
# Item.create(name: "Shabby Chic Deconstructed Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture11.png")
# Item.create(name: "Distressed Dual Tone Leather Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture12.png")
#
# # -----------------------------Kitchen
# puts "Creating Kitchen Items"
# Item.create(name: "Wasteland Chic Fridge", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen1.jpg")
# Item.create(name: "Pre-weathered Deluxe Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen2.jpg")
# Item.create(name: "Yard Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen3.jpg")
# Item.create(name: "Deluxe Toaster with Toast Extraction Tool", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen4.jpg", active: false)
# Item.create(name: "Shabby Chic Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen5.jpg")
# Item.create(name: "Deluxe 'Probably an Oven'", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen6.jpg")
# Item.create(name: "Rust Based Pan", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen7.jpg")
#
#
# # -----------------------------Seasonal
# puts "Creating Seasonal Items"
# Item.create(name: "Possibly a Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal1.jpg")
# Item.create(name: "Artesinal Jack 'O Lantern", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal2.jpg")
# Item.create(name: "Portable Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal3.jpg")
# Item.create(name: "Aged Handcrafted Carved Pumpkin", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal4.jpg")
# Item.create(name: "Ornaments Assortment", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal5.jpg")
# Item.create(name: "Pre-Lit Fireworks", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal6.jpg")
# Item.create(name: "Pre-Lit Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal7.jpg")
# Item.create(name: "Holiday Cheer Spreader", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal8.jpg", active: false)
#
# # -----------------------------Bath
# puts "Creating Bath Items"
# Item.create(name: "Polka Dot Shower Curtain", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "bath1.jpg")
# Item.create(name: "Toothbrush Assortment", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "bath2.jpg", active: false)
# Item.create(name: "Luxury Bath Mat", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "bath3.jpg")
# Item.create(name: "Shower Curtain with edge accents", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "bath4.jpg")
#
# # -----------------------------Mattresses
# Item.create(name: "Sleep mat for large dog or small child", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Mattresses"), image_path: "mattresses1.jpg")
# Item.create(name: "This item speaks for itself", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "mattresses2.jpg")
# Item.create(name: "Single Mattress with Deulxe Rorschach pattern", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "mattresses3.jpg")
# Item.create(name: "Tetris Mattress", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Mattresses"), image_path: "mattresses4.jpg", active: false)
#
# # -----------------------------Users
# 15.times do |users|
#   name = Faker::FamilyGuy.character
#   username = "#{name.gsub(/\s+/, "").downcase}"
#   password = name.split.first.downcase
#   User.create!(name: name, username: username, password: password, street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, country: Faker::Address.country, zip_code: Faker::Address.zip)
#   puts "Created #{name}'s account'"
# end
#
# # -----------------------------Orders
# def weighed_number(weights)
#   raise 'Probabilities must sum up to 1' unless weights.values.inject(&:+) == 1.0
#
#   u = 0.0
#   ranges = Hash[weights.map{ |v, p| [u += p, v] }]
#
#   u = rand
#   ranges.find{ |p, _| p > u }.last
# end
#
# 200.times do |order|
#   t1 = Time.parse("2012-11-16 12:00:00")
#   t2 = Time.parse("2018-09-15 12:00:00")
#   created = Order.create(user_id: User.all.sample.id, status: weighed_number({0 => 0.2, 1 => 0.1, 2 => 0.1, 3 => 0.6 }), created_at: rand(t1..t2), updated_at: Time.now)
#   random = weighed_number({1 => 0.2, 2 => 0.2, 3 => 0.2, 4 => 0.2, 5 => 0.2 })
#   random.times do |add_item|
#     created.items << Item.all.sample
#   end
#   puts "Created order #{created.id} for #{created.user.name}"
# end
#
# puts "Creating the admin"
# User.create(name: "admin", username: "admin", password: "admin", role: "admin")

#new seeds
puts "Creating Store"
store = StoreCreator.new("Uncle Frank's Original Goods", "All of Uncle Frank's original ideas").execute
puts "Adding store_id to existing items"
items = Item.all
items.each do |item|
  item.update(store_id: store.id)
  CategoryItem.create(category: item.category, item_id: item.id)
end
puts "Adding Categories"
category_6 = Category.create(name: "Beer")
category_7 = Category.create(name: "Books")
category_8 = Category.create(name: "Sporting Goods")
category_9 = Category.create(name: "Toys")
category_10 = Category.create(name: "Cats")
category_5 = Category.find_by(name: "Seasonal")
category_4 = Category.find_by(name: "Mattresses")
category_3 = Category.find_by(name: "Kitchen")
category_2 = Category.find_by(name: "Furniture")
category_1 = Category.find_by(name: "Bath")

puts "Adding stores"
store_2 = StoreCreator.new("store_2", Faker::Hipster.paragraph).execute
store_3 = StoreCreator.new("store_3", Faker::Hipster.paragraph).execute
store_4 = StoreCreator.new("store_4", Faker::Hipster.paragraph).execute
store_5 = StoreCreator.new("store_5", Faker::Hipster.paragraph).execute
store_6 = StoreCreator.new("store_6", Faker::Hipster.paragraph).execute
store_7 = StoreCreator.new("store_7", Faker::Hipster.paragraph).execute
store_8 = StoreCreator.new("store_8", Faker::Hipster.paragraph).execute
store_9 = StoreCreator.new("store_9", Faker::Hipster.paragraph).execute
store_10 = StoreCreator.new("store_10", Faker::Hipster.paragraph).execute
store_11 = StoreCreator.new("store_11", Faker::Hipster.paragraph).execute
store_12 = StoreCreator.new("store_12", Faker::Hipster.paragraph).execute
store_13 = StoreCreator.new("store_13", Faker::Hipster.paragraph).execute
store_14 = StoreCreator.new("store_14", Faker::Hipster.paragraph).execute
store_15 = StoreCreator.new("store_15", Faker::Hipster.paragraph).execute
store_16 = StoreCreator.new("store_16", Faker::Hipster.paragraph).execute
store_17 = StoreCreator.new("store_17", Faker::Hipster.paragraph).execute
store_18 = StoreCreator.new("store_18", Faker::Hipster.paragraph).execute
store_19 = StoreCreator.new("store_19", Faker::Hipster.paragraph).execute
store_20 = StoreCreator.new("store_20", Faker::Hipster.paragraph).execute

puts "Adding items for cats category"

50.times do |index|
  item = Item.create!(name: Faker::Cat.unique.breed,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "cat.jpg", store: store_2)
  CategoryItem.create(item: item, category: category_10)
end

puts "Adding items for toys category"

25.times do |index|
  item = Item.create!(name: Faker::Pokemon.unique.name,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "toy.jpg", store: store_3)
  CategoryItem.create(item: item, category: category_9)
end

25.times do |index|
  item = Item.create!(name: Faker::Pokemon.unique.name,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "toy.jpg", store: store_4)
  CategoryItem.create(item: item, category: category_9)
end

puts "Adding items for Sporting Goods category"

25.times do |index|
  item = Item.create!(name: Faker::Hipster.unique.word,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "Baseball.jpg", store: store_5)
  CategoryItem.create(item: item, category: category_8)
end

25.times do |index|
  item = Item.create!(name: Faker::Hipster.unique.word,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "Baseball.jpg", store: store_6)
  CategoryItem.create(item: item, category: category_8)
end

puts "Adding items to the Books category"

25.times do |index|
  item = Item.create!(name: Faker::Book.unique.title,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "book.jpg", store: store_7)
  CategoryItem.create(item: item, category: category_7)
end

25.times do |index|
  item = Item.create!(name: Faker::Book.unique.title,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "book.jpg", store: store_8)
  CategoryItem.create(item: item, category: category_7)
end

puts "Adding items to the Beer category"

25.times do |index|
  item = Item.create!(name: Faker::Beer.unique.name,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "beer.jpg", store: store_9)
  CategoryItem.create(item: item, category: category_6)
end

25.times do |index|
  item = Item.create!(name: Faker::Beer.unique.name,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "beer.jpg", store: store_10)
  CategoryItem.create(item: item, category: category_6)
end

puts "Adding items to the seasonal category"

25.times do |index|
  item = Item.create!(name: Faker::Hipster.unique.word,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "seasonal6.jpg", store: store_11)
  CategoryItem.create(item: item, category: category_5)
end

25.times do |index|
  item = Item.create!(name: Faker::Hipster.unique.word,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "seasonal5.jpg", store: store_12)
  CategoryItem.create(item: item, category: category_5)
end

puts "Adding items to the mattress category"

25.times do |index|
  item = Item.create!(name: Faker::Commerce.unique.product_name,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "mattresses2.jpg", store: store_13)
  CategoryItem.create(item: item, category: category_4)
end

25.times do |index|
  item = Item.create!(name: Faker::Commerce.unique.product_name,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "mattresses1.jpg", store: store_14)
  CategoryItem.create(item: item, category: category_4)
end

puts "Adding items to the kitchen category"

25.times do |index|
  item = Item.create!(name: Faker::Commerce.unique.product_name,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "kitchen5.jpg", store: store_15)
  CategoryItem.create(item: item, category: category_3)
end

25.times do |index|
  item = Item.create!(name: Faker::Commerce.unique.product_name,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "kitchen4.jpg", store: store_16)
  CategoryItem.create(item: item, category: category_3)
end

puts "Adding items to the furniture category"

25.times do |index|
  item = Item.create!(name: Faker::Commerce.unique.product_name,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "furniture9.jpg", store: store_17)
  CategoryItem.create(item: item, category: category_2)
end

25.times do |index|
  item = Item.create!(name: Faker::Commerce.unique.product_name,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "furniture10.jpg", store: store_18)
  CategoryItem.create(item: item, category: category_2)
end

  puts "Adding items to the bath category"

  25.times do |index|
    item = Item.create!(name: Faker::Commerce.unique.product_name,
                 description: Faker::Lorem.sentence(20, false, 0).chop,
                 price: rand(100..1000), image_path: "bath4.jpg", store: store_20)
    CategoryItem.create(item: item, category: category_1)
  end

  25.times do |index|
    item = Item.create!(name: Faker::Commerce.unique.product_name,
                 description: Faker::Lorem.sentence(20, false, 0).chop,
                 price: rand(100..1000), image_path: "bath3.jpg", store: store_19)
    CategoryItem.create(item: item, category: category_1)
  end

  # -----------------------------Users

  puts "Adding Phone and email to existing users"
  users = User.all
  users.each do |user|
    user.update(email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number)
  end

  #_____________creatiing_new_users

1000.times do |users|
  name = Faker::Name.unique.name
  username = "#{name.gsub(/\s+/, "").downcase}"
  password = name.split.first.downcase
  User.create(name: name, username: username, password: password, street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, country: Faker::Address.country, zip_code: Faker::Address.zip, phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email)
  puts "Created #{name}'s account'"
end

# -----------------------------Orders
def weighed_number(weights)
  raise 'Probabilities must sum up to 1' unless weights.values.inject(&:+) == 1.0

  u = 0.0
  ranges = Hash[weights.map{ |v, p| [u += p, v] }]

  u = rand
  ranges.find{ |p, _| p > u }.last
end

users = User.all
random_order_count = rand(10..20)
users.each do |user|
  random_order_count.times do |order|
    t1 = Time.parse("2012-11-16 12:00:00")
    t2 = Time.parse("2018-09-15 12:00:00")
    created = Order.create(user_id: user.id, status: weighed_number({0 => 0.2, 1 => 0.1, 2 => 0.1, 3 => 0.6 }), created_at: rand(t1..t2), updated_at: Time.now)
    random = weighed_number({1 => 0.2, 2 => 0.2, 3 => 0.2, 4 => 0.2, 5 => 0.2 })
    random.times do |add_item|
      created.items << Item.all.sample
    end
    puts "Created order #{created.id} for #{created.user.name}"
  end
end
