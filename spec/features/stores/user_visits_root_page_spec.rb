require 'rails_helper'

feature 'User' do
  context 'visits root page' do
    xscenario 'sees list of categories' do
      category1 = create(:category)
      category1.items << create_list(:item, 5)


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
