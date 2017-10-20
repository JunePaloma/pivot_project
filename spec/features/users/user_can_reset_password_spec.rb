require 'rails_helper'

feature 'User can reset password' do
  scenario 'and can receive text message with code that allows them to reset password' do
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
    fill_in 'Email', with: 'josh@example.com'
    # And I click `Submit`
    click_on 'Submit'
    # Then I should be redirected to "/password-confirmation"
    expect(current_path).to eq '/password-confirmation'
    # And I should see instructions to enter my confirmation code
    expect(page).to have_content "Please enter your text message confirmation code"
    # And I should have received a text message with a confirmation code

    # When I enter the confirmation code

    # And I fill in `Password` with `password`
    # And I fill in `Password Confirmation` with `password`
    # And I click "Submit"
    # Then I should be redirected to "/dashboard"
    # And I should be logged in
    # And my old password should no longer work for logging in
    # And my new password should work after logging out and logging back in
  end
end
