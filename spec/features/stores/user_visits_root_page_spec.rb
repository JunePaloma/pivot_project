require 'rails_helper'

feature 'User' do
  context 'visits root page' do
    scenario 'sees list of categories' do
      categories = create_list(:category, 5)

      visit root_path

      expect(page).to have_content(categories[0].name)
    end

    scenario 'sees link to all stores' do
      visit root_path

      expect(page).to have_selector(:link_or_button, 'All Store')
    end
  end
end
