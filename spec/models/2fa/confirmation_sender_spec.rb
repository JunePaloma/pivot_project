require 'rails_helper'

describe ConfirmationSender do
  xit '.send_confirmation' do
    user = create(:user)
    original_code = user.verification_code

    confirmation = ConfirmationSender.send_confirmation(user)

    expect(user.verification_code).to_not eq original_code
    expect(confirmation).to be true
  end
end
