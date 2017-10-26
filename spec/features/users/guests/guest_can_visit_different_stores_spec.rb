require 'rails_helper'

describe "Guest can see list of stores" do
  scenario "and can view a specific store and associated items" do
    store1, store2 = create_list(:store, 2)

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
