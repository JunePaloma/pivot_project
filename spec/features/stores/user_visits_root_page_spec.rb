require 'rails_helper'

feature 'User' do
  context 'visits root page' do
    scenario 'sees list of categories' do
      categories = create_list(:category, 5)

      visit root_path

      expect(page).to have_content(categories[0].name)
    end

    scenario 'sees list of stores' do
      stores = create_list(:store, 5)

      visit root_path

      expect(page).to have_content(stores[0].name)
    end
  end
end
