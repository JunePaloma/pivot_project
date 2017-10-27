require 'rails_helper'

feature "from the admin dashboard" do
  scenario "they can click all items and visit item index" do
    admin   = create(:operator)
    allow_any_instance_of(ApplicationController).to receive(:current_operator).and_return(admin)
    item1 = create(:item)
    item2 = create(:item)

    visit admin_stores_path


    click_on "All Items"


    expect(current_path).to eq("/admin/items")


    expect(page).to have_content(item1.name)
    expect(page).to have_content(item2.name)

    expect(page).to have_content(item1.description)
    expect(page).to have_content(item2.description)

    expect(page).to have_button("edit")
  end
end
