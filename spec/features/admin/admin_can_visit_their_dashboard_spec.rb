require 'rails_helper'

feature "as a logged in admin" do
  scenario "they are redirected to the admin stores page after they log in" do
    admin   = create(:operator)

    visit operator_login_path
    expect(current_path).to eq(operator_login_path)

    fill_in "operatorsesh[user_name]", with: admin.user_name
    fill_in "operatorsesh[password]", with: admin.password

    click_on("Login as Store Operator")

    expect(current_path).to eq(admin_stores_path)

    
  end

feature "as a logged in non-admin user" do
  scenario "they cannot visit the admin dashboard" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_stores_path

    expect(page).to have_content("The page you were looking for doesn't exist")
   end
  end

  feature "as an unregistered user" do
    scenario "they cannot visit the admin dashboard" do
      user = create(:user)

      visit admin_stores_path

      expect(page).to have_content("The page you were looking for doesn't exist")
   end
  end
end
