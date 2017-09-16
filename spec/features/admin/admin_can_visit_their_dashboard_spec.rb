require 'rails_helper'

feature "as a logged in admin" do
  scenario "they can visit the dashboard" do
    admin   = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "/admin/dashboard"

    expect(page).to have_content("Admin Dashboard")
  end
end
