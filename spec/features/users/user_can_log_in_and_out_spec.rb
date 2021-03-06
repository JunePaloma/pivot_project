require 'rails_helper'

feature "user can login and out" do
  scenario "if already registered" do
    user = create(:user)

    visit '/'

    click_on("Login")

    expect(current_path).to eq(root_path)

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password

    click_on("Log In")

    expect(current_path).to eq root_path

    visit '/dashboard'

    expect(current_path).to eq('/dashboard')
    click_on("arrow_drop_down")

    expect(page).to have_content("Logged in as: #{user.username}")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")

    click_on "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("Logout")
    expect(page).to have_content("Login")
  end
  scenario "if a user enters invalid credentials" do
    visit '/'

    click_on("Login")

    expect(current_path).to eq(root_path)

    fill_in "session[username]", with: "invalid_username"
    fill_in "session[password]", with: "invalid_password"

    click_on("Log In")

    expect(page).to have_content("Login Unsuccessful")
  end
  scenario "user can log in with Oauth-Twitter" do

    stub_omniauth

    visit '/'

    click_on("Login")
    click_on(id: 'oauth_twitter_link')

    expect(page).to have_content("Login Successful")
    expect(page).to have_content("Logged in as: Josh")
  end
end
