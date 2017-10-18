require 'rails_helper'

feature "User visits stores index" do
  scenario "and can see all stores" do
    create_list(:store, 5)
    first_store = Store.first
    first_store.update(name: "Charlie's Couch Corner")
    last_store = Store.last
    last_store.update(name: "Sweet Dee's Birdhouses")

    visit '/'

    click_on 'View Stores'

    expect(current_path).to eq stores_path

    expect(page).to have_content first_store.name
    expect(page).to have_content last_store.name
  end
end