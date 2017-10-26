require 'rails_helper'

describe 'As a registered user' do
  it "I visit my profile page" do
    user   = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'
    expect(page).to have_content(user.username)
    expect(page).to have_content(user.address)
    expect(page).to have_content(user.phone)
    expect(page).to have_content(user.email)
  end
end
