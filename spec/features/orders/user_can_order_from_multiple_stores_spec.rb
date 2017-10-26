require 'rails_helper'

describe 'User can order multiple items from different stores' do
  scenario 'and see multiple orders' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = create(:category)
    store1, store2 = create_list(:store, 2)
    item1, item2, item3 = create_list(:item, 3, store: store1, category: category)
    item4, item5, item6 = create_list(:item, 3, store: store2, category: category)

    visit "/#{store1.slug}"

    click_on 'add_shopping_cart', match: :first
    click_on 'add_shopping_cart', match: :first

    visit "/#{store2.slug}"

    click_on 'add_shopping_cart', match: :first

    click_on('shopping_cart')

    click_on('Checkout')

    order1 = Order.first
    order2 = Order.last

    expect(Order.count).to eq 2
    expect(page).to have_css(".order#{order1.id}")
    expect(page).to have_css(".order#{order2.id}")
  end
end
