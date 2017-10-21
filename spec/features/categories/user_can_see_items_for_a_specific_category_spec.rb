
require 'rails_helper'

feature "visitor can view all items" do
  scenario "for a specific category by name" do
    category1 = Category.create(name: "category")
    item_1 = Item.create(name: "Another something" , description: "Something", price: 1000)
    CategoryItem.create(category: category1, item: item_1)
    item_2 = Item.create(name: "A thing" , description: "Something", price: 1000)
    CategoryItem.create(category: category1, item: item_2)

    category3 = Category.create(name: "category3")
    item_3 = Item.create(name: "An item again" , description: "Something", price: 1000)
    CategoryItem.create(category: category3, item: item_3)
    item_4 = Item.create(name: "Something else" , description: "Something", price: 1000)
    CategoryItem.create(category: category3, item: item_4)

    visit category_path(category1.id)

    expect(page).to have_content(category1.items[0].name)
    expect(page).to have_content(category1.items[1].name)
    expect(page).to_not have_content(category3.items[0].name)
    expect(page).to_not have_content(category3.items[1].name)

    visit category_path(category3.id)

    expect(page).to have_content(category3.items[0].name)
    expect(page).to have_content(category3.items[1].name)
    expect(page).to_not have_content(category1.items[0].name)
    expect(page).to_not have_content(category1.items[1].name)
  end
end
