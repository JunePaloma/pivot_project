require 'rails_helper'

feature "from the items index and admin" do
  scenario "can click edit item and visit edit item page" do
    admin   = create(:operator)
    admins_store = create(:store)
    StoreOperator.create!(store: admins_store, operator: admin)
    item1 = create(:item, store: admins_store)
    item2 = create(:item, store: admins_store)

    visit operator_login_path
    fill_in "operatorsesh[user_name]", with: admin.user_name
    fill_in "operatorsesh[password]", with: admin.password
    
    click_on("Login as Store Operator")

    visit admin_items_path
    click_on "edit", :match => :first

    expect(current_path).to eq(edit_admin_item_path(item1))
    fill_in "item[name]", with: "NewGrossCouch"
    fill_in "item[description]", with: "changed description"
    fill_in "item[image_path]", with: "uncle_frank.jpg"
    click_on "Update"

    expect(current_path).to eq(item_path(item1))
    expect(page).to have_content("NewGrossCouch")
    expect(page).to have_content("changed description")
  end
end
