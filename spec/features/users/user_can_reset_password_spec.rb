require 'rails_helper'

feature 'User can reset password' do
  xscenario 'and can receive text message with code that allows them to reset password' do
    user = create(:user)
    # As a guest user
    visit '/'
    # When I visit "/login"
    click_on 'Login'
    # And I click "Forgot my Password"
    click_on 'Forgot my Password'
    # Then I should be on '/password-reset'
    expect(current_path).to eq '/password-reset'

    # When I fill in `Email` with "josh@example.com"
    fill_in 'Email', with: user.email
    # And I click `Submit`
    click_on 'Submit'
    # Then I should be redirected to "/password-confirmation"
    expect(current_path).to eq '/password-confirmation'
    # And I should see instructions to enter my confirmation code
    expect(page).to have_content "Please enter your verification code"
    # And I should have received a text message with a confirmation code
    v_code = User.first.verification_code
    # When I enter the confirmation code
    fill_in 'Verification Code', with: v_code
    # And I fill in `Password` with `password`
    fill_in 'New Password', with: '123456' 
    # And I fill in `Password Confirmation` with `password`
    fill_in 'Password Confirmation', with: '123456'
    # And I click "Submit"
    click_on 'Submit'
    # Then I should be redirected to "/dashboard"
    expect(current_path).to eq dashboard_path
    # And I should be logged in
    expect(page).to have_content "Logged in as: #{user.username}"
    expect(page).to have_content 'Edit My Account'
    # And my old password should no longer work for logging in
    # And my new password should work after logging out and logging back in
    click_on("arrow_drop_down")
    click_on 'Logout'

    expect(current_path).to eq root_path

    click_on 'Login'

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: '12345'

    click_on("Log In")

    expect(page).to have_content "Logged in as: #{user.username}"
    expect(page).to have_content 'Edit My Account'

    click_on("arrow_drop_down")
    click_on 'Logout'

    expect(current_path).to eq root_path

    click_on 'Login'

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: 'MyPassword'

    click_on("Log In")

    expect(page).to have_content "Logged in as: #{user.username}"
    expect(page).to have_content 'Edit My Account'
  end
end
