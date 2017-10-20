# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ItemOrder.destroy_all
CategoryItem.destroy_all
Item.destroy_all
Category.destroy_all
Order.destroy_all
User.destroy_all
Store.destroy_all

category_1 = Category.create(name: "Bath")
category_2 = Category.create(name: "Furniture")
category_3 = Category.create(name: "Kitchen")
category_4 = Category.create(name: "Mattresses")
category_5 = Category.create(name: "Seasonal")
category_6 = Category.create(name: "Beer")
category_7 = Category.create(name: "Jewelry")
category_8 = Category.create(name: "Sporting Goods")
category_9 = Category.create(name: "Toys")
category_10 = Category.create(name: "Cats")

#------------------------------Stores

puts "Creating Stores"

store_1 = StoreCreator.new("store_1", Faker::Hipster.paragraph).execute
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



# stores = ["store_1", "store_2", "store_3", "store_4", "store_5", "store_6", "store_7", "store_8", "store_9", "store_10",
#           "store_11", "store_12", "store_13", "store_14", "store_15", "store_16", "store_17", "store_18", "store_19", "store_20"]
# stores.each do |store|
#   business = StoreCreator.new(store, Faker::Hipster.paragraph).execute
#   puts "Created #{business.name} "
# end

# -----------------------------Furniture
puts "Creating Furniture Items"
item_1 = Item.create(name: "Reduced Height Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture1.png", store: store_2)
item_2 = Item.create(name: "Pallet Chic Backyard Set", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture2.png", store: store_2)
item_3 = Item.create(name: "Distressed Beach Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture3.png", store: store_2)
item_4 = Item.create(name: "Antique Entertainment Center", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture4.png", store: store_2)
item_5 = Item.create(name: "Shabby Chic Retro Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture5.png", store: store_2)
item_6 = Item.create(name: "Extended Storage Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture6.png", store: store_2)
item_7 = Item.create(name: "Dual Tone Distressed Deconstructed Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture7.png", active: false, store: store_2)
item_8 = Item.create(name: "Overstuffed Deconstruced Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture8.png", store: store_2)
item_9 = Item.create(name: "Floral Pattern Yard Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture9.png", active: false, store: store_2)
item_10 = Item.create(name: "Wasteland Chic Chaise", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture10.png", store: store_2)
item_11 = Item.create(name: "Shabby Chic Deconstructed Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture11.png", store: store_2)
item_12 = Item.create(name: "Distressed Dual Tone Leather Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "furniture12.png", store: store_2)

# -----------------------------Kitchen
puts "Creating Kitchen Items"
item_13 = Item.create(name: "Wasteland Chic Fridge", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "kitchen1.jpg", store: store_3)
item_14 = Item.create(name: "Pre-weathered Deluxe Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "kitchen2.jpg", store: store_3)
item_15 = Item.create(name: "Yard Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "kitchen3.jpg", store: store_3)
item_16 = Item.create(name: "Deluxe Toaster with Toast Extraction Tool", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "kitchen4.jpg", active: false, store: store_3)
item_17 = Item.create(name: "Shabby Chic Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "kitchen5.jpg", store: store_3)
item_18 = Item.create(name: "Deluxe 'Probably an Oven'", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "kitchen6.jpg", store: store_3)
item_19 = Item.create(name: "Rust Based Pan", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "kitchen7.jpg", store: store_3)


# -----------------------------Seasonal
puts "Creating Seasonal Items"
item_20 = Item.create(name: "Possibly a Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "seasonal1.jpg", store: store_5)
item_21 = Item.create(name: "Artesinal Jack 'O Lantern", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "seasonal2.jpg", store: store_5)
item_22 = Item.create(name: "Portable Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "seasonal3.jpg", store: store_5)
item_23 = Item.create(name: "Aged Handcrafted Carved Pumpkin", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "seasonal4.jpg", store: store_5)
item_24 = Item.create(name: "Ornaments Assortment", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "seasonal5.jpg", store: store_5)
item_25 = Item.create(name: "Pre-Lit Fireworks", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "seasonal6.jpg", store: store_5)
item_26 = Item.create(name: "Pre-Lit Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "seasonal7.jpg", store: store_5)
item_27 = Item.create(name: "Holiday Cheer Spreader", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "seasonal8.jpg", active: false, store: store_5)

# -----------------------------Bath
puts "Creating Bath Items"
item_28 = Item.create(name: "Polka Dot Shower Curtain", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "bath1.jpg", store: store_1)
item_29 = Item.create(name: "Toothbrush Assortment", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "bath2.jpg", active: false, store: store_1)
item_30 = Item.create(name: "Luxury Bath Mat", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "bath3.jpg", store: store_1)
item_31 = Item.create(name: "Shower Curtain with edge accents", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "bath4.jpg", store: store_1)

# -----------------------------Mattresses
puts "Creating Mattress Items"

item_32 = Item.create(name: "Sleep mat for large dog or small child", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "mattresses1.jpg", store: store_4)
item_33 = Item.create(name: "This item speaks for itself", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "mattresses2.jpg", store: store_4)
item_34 = Item.create(name: "Single Mattress with Deulxe Rorschach pattern", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "mattresses3.jpg", store: store_4)
item_35 = Item.create(name: "Tetris Mattress", description: Faker::Hipster.paragraph, price: rand(100..1000), image_path: "mattresses4.jpg", active: false, store: store_4)

#___________________________Item_Categories
puts "Creating Item Categories"
CategoryItem.create(item: item_32, category: category_4)
CategoryItem.create(item: item_33, category: category_4)
CategoryItem.create(item: item_34, category: category_4)
CategoryItem.create(item: item_35, category: category_4)
CategoryItem.create(item: item_28, category: category_1)
CategoryItem.create(item: item_29, category: category_1)
CategoryItem.create(item: item_30, category: category_1)
CategoryItem.create(item: item_31, category: category_1)
CategoryItem.create(item: item_20, category: category_5)
CategoryItem.create(item: item_21, category: category_5)
CategoryItem.create(item: item_22, category: category_5)
CategoryItem.create(item: item_23, category: category_5)
CategoryItem.create(item: item_24, category: category_5)
CategoryItem.create(item: item_25, category: category_5)
CategoryItem.create(item: item_26, category: category_5)
CategoryItem.create(item: item_27, category: category_5)
CategoryItem.create(item: item_13, category: category_3)
CategoryItem.create(item: item_14, category: category_3)
CategoryItem.create(item: item_15, category: category_3)
CategoryItem.create(item: item_16, category: category_3)
CategoryItem.create(item: item_17, category: category_3)
CategoryItem.create(item: item_18, category: category_3)
CategoryItem.create(item: item_19, category: category_3)
CategoryItem.create(item: item_1, category: category_2)
CategoryItem.create(item: item_2, category: category_2)
CategoryItem.create(item: item_3, category: category_2)
CategoryItem.create(item: item_4, category: category_2)
CategoryItem.create(item: item_5, category: category_2)
CategoryItem.create(item: item_6, category: category_2)
CategoryItem.create(item: item_7, category: category_2)
CategoryItem.create(item: item_8, category: category_2)
CategoryItem.create(item: item_9, category: category_2)
CategoryItem.create(item: item_10, category: category_2)
CategoryItem.create(item: item_11, category: category_2)
CategoryItem.create(item: item_12, category: category_2)
CategoryItem.create(item: item_32, category: category_2)
CategoryItem.create(item: item_33, category: category_2)
CategoryItem.create(item: item_34, category: category_2)
CategoryItem.create(item: item_35, category: category_2)

puts "Adding items for cats category"

25.times do |index|
  item = Item.create!(name: Faker::Cat.unique.breed,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "cat.jpg", store: store_1)
  CategoryItem.create(item: item, category: category_10)
end

25.times do |index|
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

puts "Adding items to the Jewelry category"

25.times do |index|
  item = Item.create!(name: Faker::Hipster.unique.word,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "jewelry.jpg", store: store_7)
  CategoryItem.create(item: item, category: category_7)
end

25.times do |index|
  item = Item.create!(name: Faker::Hipster.unique.word,
               description: Faker::Lorem.sentence(20, false, 0).chop,
               price: rand(100..1000), image_path: "jewelry.jpg", store: store_8)
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
1000.times do |users|
  name = Faker::Name.unique.name
  username = "#{name.gsub(/\s+/, "").downcase}"
  password = name.split.first.downcase
  User.create(name: name, username: username, password: password, street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, country: Faker::Address.country, zip_code: Faker::Address.zip)
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

puts "Creating the admin"

User.create(name: "admin", username: "admin", password: "admin", role: "admin")
User.create(name: "Josh", username: "josh@turing.io", password: "password")
