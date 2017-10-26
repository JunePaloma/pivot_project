require 'rails_helper'

describe 'Registered user can request a new store' do
  scenario 'and can see the status of their requests' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    click_on 'Request a Store'

    expect(current_path).to eq new_store_request_path

    fill_in 'store_request[name]', with: 'Cool Store'
    fill_in 'store_request[description]', with: 'This is a cool store'
    click_on 'Submit'

    expect(current_path).to eq store_requests_path

    expect(page).to have_content("Cool Store")
    expect(page).to have_content("This is a cool store")
    expect(page).to have_content("Pending Review")
  end
end