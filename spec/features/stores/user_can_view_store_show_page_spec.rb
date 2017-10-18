require "rails_helper"

describe "user can visit store show page" do
  it "and view info about the store" do
    store = create(:store)
    store.items = create_list(:item, 5)
    item_1 = store.items.first

    visit store_path(store)
    save_and_open_page
    expect(page).to have_content(store.description)
    expect(page).to have_link(item_1.name)
  end
end
