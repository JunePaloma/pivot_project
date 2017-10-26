require 'rails_helper'

describe 'Platform Admin can view all store requests' do
  scenario 'and can approve or decline individual store requests' do
    admin = create(:operator)
    admin.platform_admin!
    allow_any_instance_of(ApplicationController).to receive(:current_operator).and_return(admin)

    user = create(:user)
    sr1 = create(:store_request, user: user)
    sr2 = create(:store_request, user: user)
    sr3 = create(:store_request, user: user)

    visit admin_dashboard_index_path

    click_on "View Store Requests"

    expect(current_path).to eq admin_store_requests_path
    
    expect(page).to have_content("#{sr1.name}")
    expect(page).to have_content("#{sr1.id}")
    expect(page).to have_content("#{sr1.user}")
    expect(page).to have_content("#{sr1.updated_at.to_formatted_s(:long_ordinal)}")
    expect(page).to have_content("#{sr1.created_at.to_formatted_s(:long_ordinal)}")
    expect(page).to have_content("Pending", count: 3)
    expect(page).to have_selector(:link_or_button, 'Approve', count: 3)
    expect(page).to have_selector(:link_or_button, 'Decline', count: 3)

    within("request#{sr1.id}") do
      click_on 'Decline'
      expect(page).to have_content("Declined")
    end

    within("request#{sr2.id}") do
      click_on 'Approve'
      expect(page).to have_content("Approved")
    end

    expect(page).to have_content("Created Store #{sr2.name} and Admin #{sr2.user.name}")

    visit "/#{sr2.name}"

    expect(current_path).to eq store_path("#{sr2.name}")

    expect(page).to have_content("#{sr2.name}")
  end
end
