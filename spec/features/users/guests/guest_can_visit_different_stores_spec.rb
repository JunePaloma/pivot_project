require 'rails_helper'

describe "Guest can see list of stores" do
  scenario "and can view a specific store and associated items" do
    store1 = StoreCreator.new("Charlies Couch Corner", "A store with couches").execute
    items = create_list(:item, 5, store: store1)
    store1.items << items
    store2 = StoreCreator.new("Sweet Dee's Birdhouses", "A store with birdhouses").execute
    items2 = create_list(:item, 5, store: store2)
    store2.items << items2


    visit '/'

    click_on 'View Stores'

    expect(page).to have_content(store1.name)
    expect(page).to have_content(store2.name)

    click_on store1.name

    expect(current_path).to eq "/#{store1.slug}"

    visit stores_path

    click_on store2.name

    expect(current_path).to eq "/#{store2.slug}"
  end
end
