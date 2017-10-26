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

    sr = StoreRequest.first

    expect(page).to have_content("Cool Store")
    expect(page).to have_content("#{sr.id}")
    expect(page).to have_content("#{sr.updated_at.to_formatted_s(:long_ordinal)}")
    expect(page).to have_content("#{sr.created_at.to_formatted_s(:long_ordinal)}")
    expect(page).to have_content("Pending")
  end
end