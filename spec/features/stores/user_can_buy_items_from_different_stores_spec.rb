require 'rails_helper'

feature 'User' do
  scenario 'can buy items from different stores' do
    stores = create_list(:store, 5)

    stores.each do |store|
      store.items = create_list(:item, 5)
    end

    visit "/#{stores[0].slug}"

    all('a', :text => "#{stores[0].slug}")[1].click
  end
end
