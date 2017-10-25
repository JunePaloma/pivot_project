require 'rails_helper'

feature "as a logged in admin" do
  scenario "I can modify my data" do
    admin   = create(:operator, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_operator).and_return(admin)

  visit edit_admin_operator_path(admin)

    fill_in "operator[user_name]", with: "Frankie"
    fill_in "operator[name]", with: "Frankie"

    click_on "Update"

    expect(current_path).to eq(admin_dashboard_index_path)

    expect(Operator.last.id).to eq(admin.id)
    expect(Operator.last.name).to eq("Frankie")
  end

  scenario "I can modify my data with valid attributes" do
    admin   = create(:operator, user_name: "Bill", role: 1)

    allow_any_instance_of(ApplicationController).to receive(
    :current_operator).and_return(admin)

    visit '/admin/dashboard'

    click_on "Edit My Account"

    expect(current_path).to eq(edit_admin_operator_path(admin))

    fill_in "operator[user_name]", with: "Bill"
    fill_in "operator[name]", with: "Frankie"

    click_on "Update"

    expect(current_path).to eq(edit_admin_user_path(admin))
    expect(page).to have_content("Update failed")
  end

  xscenario "I cant modify other user data" do
    admin   = create(:operator, role: 1)
    operator  = create(:operator)

    allow_any_instance_of(ApplicationController).to receive(:current_operator).and_return(admin)

    visit "/admin/operator/#{operator.id}/edit"

    expect(page).to have_content("The page you were looking for doesn't exist")
  end


end
