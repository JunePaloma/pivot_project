require 'rails_helper'

feature "Platform Admin can log in and out" do
  scenario "if already registered" do
    user = User.create(username: "PlatformAdmin1", password: "password", platform_admin: true)

    visit '/'

    click_on("Login")

    expect(current_path).to eq(root_path)

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password

    click_on("Log In")

    expect(current_path).to eq(platform_admin_dashboard_path)
    expect(page).to have_content("Platform Admin Dashboard")


    click_on "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("Logout")
    expect(page).to have_content("Login")
  end

  scenario "sad path platform admin log in" do
    user = User.create(username: "NotAPlatformAdmin", password: "password")

    visit '/'

    click_on("Login")

    expect(current_path).to eq(root_path)

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password

    click_on("Log In")
    visit platform_admin_dashboard_path

    expect(current_path).not_to eq(platform_admin_dashboard_path)
    expect(page).to have_content("404")
  end
end
