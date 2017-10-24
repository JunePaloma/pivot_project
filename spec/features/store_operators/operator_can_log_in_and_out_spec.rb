require 'rails_helper'

feature "store operator can login and out" do
  scenario "when registered as a manager" do
    store_mgr = Operator.create(user_name: "Busman", password: "password")

    visit operator_login_path
    expect(current_path).to eq(operator_login_path)

    fill_in "operatorsesh[user_name]", with: store_mgr.user_name
    fill_in "operatorsesh[password]", with: store_mgr.password

    click_on("Login as Store Operator")
    expect(page).to have_content("Logged in as: Administrator")
    expect(current_path).to eq(admin_dashboard_index_path)


  end

  scenario "registered as an admin" do
    store_admin = Operator.create(user_name: "Adman", password: "password", role: 1)

    visit operator_login_path

    fill_in "operatorsesh[user_name]", with: store_admin.user_name
    fill_in "operatorsesh[password]", with: store_admin.password

    click_on("Login as Store Operator")

    expect(page).to have_content("Logged in as: Administrator")
    expect(current_path).to eq(admin_dashboard_index_path)

    expect(page).to have_link("Mark as paid")    

    click_on "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("Logout")
    expect(page).to have_content("Login")
  end

  scenario "if a user enters invalid credentials" do
    visit operator_login_path



    expect(current_path).to eq(operator_login_path)

    fill_in "operatorsesh[user_name]", with: "invalid_user_name"
    fill_in "operatorsesh[password]", with: "invalid_password"

    click_on("Login as Store Operator")

    expect(page).to have_content("Login Unsuccessful")
  end
end
