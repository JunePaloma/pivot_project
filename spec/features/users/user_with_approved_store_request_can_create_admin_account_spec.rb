require 'rails_helper'

describe 'User who has an approved store request can create an admin account' do
  scenario 'and is logged in as an admin' do
    user = create(:user)
    sr1 = create(:store_request, user: user, status: 'approved')
    store = create(:store, name: sr1.name, description: sr1.description, slug: sr1.name.parameterize)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    click_on 'View Store Requests'

    expect(page).to have_content("Approved")

    click_on 'Create Admin Account'

    expect(current_path).to eq new_admin_operator_path

    fill_in 'operator[name]', with: user.name
    fill_in 'operator[user_name]', with: user.username
    fill_in 'operator[email]', with: user.email
    fill_in 'operator[password]', with: '12345'
    fill_in 'operator[password_confirmation]', with: '12345'
    click_on 'Create Account'

    assigned_store = Store.last

    expect(current_path).to eq admin_dashboard_index_path
    expect(assigned_store.operators.last.name).to eq user.name
  end

  scenario 'and user without approved store requests cannot create an account' do
    user = create(:user)
    sr1 = create(:store_request, user: user, status: 'declined')
    store = create(:store, name: sr1.name, description: sr1.description, slug: sr1.name.parameterize)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    click_on 'View Store Requests'

    expect(page).to_not have_content("Approved")
    expect(page).to_not have_content("Create Admin Account")

    visit new_admin_operator_path

    expect(page).to have_content("404")
    expect(page).to_not have_content("Create Account")
  end
end