require 'rails_helper'

feature "as a logged in admin" do
  scenario "I can modify my data" do
    admin   = create(:operator, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_operator).and_return(admin)

  visit edit_admin_operator_path(admin)

    fill_in "operator[user_name]", with: "Frankie"
    fill_in "operator[name]", with: "Frankie"

    click_on "Update"

    expect(current_path).to eq(admin_stores_path)

    expect(Operator.last.id).to eq(admin.id)
    expect(Operator.last.name).to eq("Frankie")
  end

  scenario "I can modify my data with valid attributes" do
    admin   = create(:operator, user_name: "Bill", role: 1)

    allow_any_instance_of(ApplicationController).to receive(
    :current_operator).and_return(admin)

    visit edit_admin_operator_path(admin)

    fill_in "operator[user_name]", with: "Bill"
    fill_in "operator[name]", with: "Frankie"

    click_on "Update"

    expect(current_path).to eq(admin_stores_path)

  end

  scenario "I can modify other operator data" do
    admin   = create(:operator, role: 1)
    operator  = create(:operator)

    allow_any_instance_of(ApplicationController).to receive(:current_operator).and_return(admin)

    visit "/admin/operators/#{operator.id}/edit"

  #expectation TBD
  end


end
