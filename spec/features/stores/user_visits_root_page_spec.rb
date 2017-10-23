require 'rails_helper'

feature 'User' do
  context 'visits root page' do
    xscenario 'sees list of categories' do
      category = Category.create(name: "I'm a category")
      item_1 = Item.create(name: "An item" , description: "Something", price: 1000)
      CategoryItem.create(category: category, item: item_1)

      visit root_path

      expect(page).to have_content(category.name)
    end

    scenario 'sees link to all stores' do
      visit root_path

      expect(page).to have_selector(:link_or_button, 'View Stores')
      page.assert_selector(:css, 'a[href="/stores"]')
    end
  end
end
