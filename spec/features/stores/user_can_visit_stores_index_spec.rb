require 'rails_helper'

feature "User visits stores index" do
  scenario "and can see all stores" do
    first_store = StoreCreator.new("Charlies Couch Corner", "A store with couches").execute
    items = create_list(:item, 5)
    first_store.items << items
    last_store = StoreCreator.new("Sweet Dee's Birdhouses", "A store with birdhouses").execute
    items2 = create_list(:item, 5)
    last_store.items << items2
    binding.pry
    visit '/'

    click_on 'View Stores'

    expect(current_path).to eq stores_path

    expect(page).to have_content first_store.name
    expect(page).to have_content last_store.name
  end
end
