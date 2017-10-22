require 'rails_helper'

feature "store operator can login and out" do
  scenario "when registered as a manager" do
    store_mgr = StoreOperator.create(user_name: "Busman", password: "password")

    visit store_operator_login_path

    click_on("Login as Store Operator")

    expect(current_path).to eq(store_operator_login_path)

    fill_in "operatorsesh[username]", with: store_mgr.username
    fill_in "operatorsesh[password]", with: store_mgr.password

    click_on("Log In")

    expect(current_path).to eq admin_dashboard_index_path


    expect(page).to have_content("Logged in as: #{store_mgr.username}")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")

    click_on "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("Logout")
    expect(page).to have_content("Login")
  end

  scenario "registered as an admin" do
    store_admin = StoreOperator.create(user_name: "Adman", password: "password", role: 1)

    visit store_operator_login_path

    click_on("Login as Store Operator")

    expect(current_path).to eq(store_operator_login_path)

    fill_in "session[username]", with: store_admin.user_name
    fill_in "session[password]", with: store_admin.password

    click_on("Log In")

    expect(current_path).to eq root_path

    visit '/operator_dashboard'

    expect(current_path).to eq('/operator_dashboard')
    click_on("arrow_drop_down")

    expect(page).to have_content("Logged in as: #{store_admin.user_name}")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")
    expect(page).to have_link("Update Store")
    expect(page).to have_link("Manage store operators")

    click_on "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("Logout")
    expect(page).to have_content("Login")
  end

  scenario "if a user enters invalid credentials" do
    visit 'store_operator_login_path'

    click_on("Login as Store Operator")

    expect(current_path).to eq(root_path)

    fill_in "session[username]", with: "invalid_user_name"
    fill_in "session[password]", with: "invalid_password"

    click_on("Log In")

    expect(page).to have_content("Login Unsuccessful")
  end
end
