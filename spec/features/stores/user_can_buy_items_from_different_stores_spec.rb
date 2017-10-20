require 'rails_helper'

feature 'User' do
  scenario 'can add items from different stores to cart' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    stores = create_list(:store, 5)

    stores.each do |store|
      store.items = create_list(:item, 5)
    end

    visit "/#{stores[0].slug}"
    click_on('add_shopping_cart', match: :first)
    visit "/#{stores[2].slug}"
    click_on('add_shopping_cart', match: :first)
    visit "/#{stores[1].slug}"
    click_on('add_shopping_cart', match: :first)

    click_on('shopping_cart')

    expect(page).to have_content(stores[0].items.first.name)
    expect(page).to have_content(stores[1].items.first.name)
    expect(page).to have_content(stores[2].items.first.name)
  end
end
