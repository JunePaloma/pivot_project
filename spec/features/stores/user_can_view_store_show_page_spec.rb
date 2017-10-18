require "rails_helper"

describe "user can visit store show page" do
  it "and view info about the store" do
    store = create(:store_with_items)
    item_1 = store.items.first

    visit store_path(store)

    expect(page).to have_content(store.description)
    expect(page).to have_link(item_1.name)
  end
end
