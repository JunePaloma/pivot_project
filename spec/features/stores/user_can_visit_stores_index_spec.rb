require 'rails_helper'

feature "User visits stores index" do
  scenario "and can see all stores" do
    create_list(:store, 5)
    first_store = Store.first
    items = create_list(:item, 5)
    first_store.items << items
    first_store.update(name: "Charlie's Couch Corner")
    last_store = Store.last
    items2 = create_list(:item, 5)
    last_store.items << items2
    last_store.update(name: "Sweet Dee's Birdhouses")

    visit '/'

    click_on 'View Stores'

    expect(current_path).to eq stores_path

    expect(page).to have_content first_store.name
    expect(page).to have_content last_store.name
  end
end
